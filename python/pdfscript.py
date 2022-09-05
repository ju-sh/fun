import argparse
import subprocess
import tempfile

"""
select pages: gs
crop borders: pdfcrop
landscape/portrait: pdfnup
"""

tmp1 = tempfile.TemporaryFile()

# subprocess.run(["ls", "-l"])

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--landscape", action="store_true")
    parser.add_argument("--crop-margins", help="l t r b")
    parser.add_argument("--pages", help="pages to include") # how about a not-pages
    parser.add_argument("--gs-path", help="Path to gs executable", default="pdfcrop")
    parser.add_argument("--pdfcrop-path", help="Path to pdfcrop executable", default="pdfcrop")
    parser.add_argument("--pdfnup-path", help="Path to pdfnup executable", default="pdfnup")
