$slides = Get-ChildItem "c:\Users\garci\Videos\amanual_mg400\Dobot_PPTX_Extracted\ppt\slides\slide*.xml"
$output = @()

foreach ($s in $slides) {
    $num = [int]($s.BaseName -replace "slide", "")
    # Read file using .NET to avoid PowerShell overhead
    $content = [System.IO.File]::ReadAllText($s.FullName)
    
    # Extract text from <a:t>...</a:t>
    $chunks = $content -split "<a:t>"
    $txt = ""
    foreach ($c in $chunks) {
        if ($c -like "*</a:t>*") {
            $txt += ($c -split "</a:t>")[0] + " "
        }
    }
    
    # Clean up double spaces or tabs
    $txt = $txt.Trim()
    
    $relsPath = "c:\Users\garci\Videos\amanual_mg400\Dobot_PPTX_Extracted\ppt\slides\_rels\$($s.Name).rels"
    $imgs = @()
    if (Test-Path $relsPath) {
        $relsContent = [System.IO.File]::ReadAllText($relsPath)
        $rchunks = $relsContent -split 'Target="'
        foreach ($rc in $rchunks) {
            if ($rc -like "*media/image*") {
                $targetVal = ($rc -split '"')[0]
                if ($targetVal -like "*media/image*") {
                    # Extract the leaf file name (e.g. image1.png)
                    $leaf = $targetVal
                    if ($targetVal -contains "/") {
                        $parts = $targetVal -split "/"
                        $leaf = $parts[-1]
                    }
                    if ($leaf -contains "\") {
                        $parts = $leaf -split "\\"
                        $leaf = $parts[-1]
                    }
                    $imgs += $leaf
                }
            }
        }
    }
    
    $imgStr = $imgs -join ", "
    $shortTxt = $txt
    if ($txt.Length -gt 300) { $shortTxt = $txt.Substring(0, 300) }
    
    $output += "SLIDE $num"
    $output += "  TEXT: $shortTxt"
    $output += "  IMAGES: $imgStr"
    $output += ("-" * 80)
}

$output | Out-File "c:\Users\garci\Videos\amanual_mg400\manual-mg400\slide_map.txt" -Encoding utf8
Write-Host "Mapped slides successfully!"
