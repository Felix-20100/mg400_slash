import sys
import PyPDF2

def extract_text(pdf_path, txt_path):
    try:
        with open(pdf_path, 'rb') as f:
            reader = PyPDF2.PdfReader(f)
            text = ""
            for page in reader.pages:
                t = page.extract_text()
                if t: text += t + "\n"
        with open(txt_path, 'w', encoding='utf-8') as out:
            out.write(text)
        print(f"Extracted {pdf_path} to {txt_path}")
    except Exception as e:
        print(f"Error extracting {pdf_path}: {e}")

if __name__ == '__main__':
    extract_text("Dobot MG400 User Guide V1.7_20231116_en.pdf", "mg400_manual_text.txt")
    extract_text("DobotStudio Pro User Guide (MG400&M1 Pro) V2.8.0_20240226_en.pdf", "dobotstudio_manual_text.txt")
