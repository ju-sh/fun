import argparse
import subprocess

"""
select pages: gs
crop borders: pdfcrop
landscape/portrait: pdfnup



"""

# subprocess.run(["ls", "-l"])

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--landscape", action="store_true")
    parser.add_argument("--crop-margins", help="l t r b")
    parser.add_argument("--pages", help="pages to include") # how about a not-pages
