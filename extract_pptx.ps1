$files = Get-ChildItem -Filter "*.pptx"

foreach ($f in $files) {
    $pptx = $f.Name
    Write-Host "Extracting $pptx"
    $baseName = $f.BaseName
    $zipPath = ".\temp_$($f.Name.GetHashCode()).zip"
    $dest = ".\temp_dir_$($f.Name.GetHashCode())"
    
    Copy-Item -Path $f.FullName -Destination $zipPath -Force
    Expand-Archive -Path $zipPath -DestinationPath $dest -Force
    
    $xmlFiles = Get-ChildItem -Path "$dest\ppt\slides\slide*.xml"
    $out = ""
    foreach ($xmlFile in $xmlFiles) {
        try {
            [xml]$xml = Get-Content $xmlFile.FullName
            $textNodes = $xml.GetElementsByTagName("a:t")
            foreach ($node in $textNodes) { $out += $node.InnerText + " " }
            $out += "`n---`n"
        } catch {
            Write-Host "Failed to parse XML in $($xmlFile.FullName)"
        }
    }
    
    $out | Out-File ".\$baseName.txt" -Encoding utf8
    Remove-Item $zipPath -Force
    Remove-Item $dest -Recurse -Force
}
