import argparse
import subprocess
import tempfile

"""
select pages: gs
crop borders: pdfcrop
landscape/portrait: pdfnup
"""

tmp1 = tempfile.TemporaryFile()
tmp2 = tempfile.TemporaryFile()

# gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -sPageList=$PAGES -sOutputFile=$INFILE $SELECTED
# pdfcrop --margins $MARGINS $SELECTED $CROPPED
# ./pdfnup --nup $ARG $INFILE -o $OUTFILE [--landscape]

# subprocess.run(["ls", "-l"])


"""
https://docs.python.org/3/library/subprocess.html
https://docs.python.org/3/library/tempfile.html

cmds:
 - gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -sPageList=$ARG -sOutputFile=$INFILE $OUTFILE
 - pdfcrop --margins $ARG $INFILE $OUTFILE
 - ./pdfnup --nup $LAYOUT $INFILE -o $OUTFILE --landscape
---

Check which all ops are active
There are flags for each op: o1, o2, o3

Seleted ops = selops:list 
tmp1 = temp()
tmp2 = temp()
files = [fin, tmp1, tmp2, fout]
infile = 0
outfile = -1

while selops:
    print(f"{infile} -> {outfile}")
    infile = outfile
    if outfile == 1:
        outfile = 2
    else:
        outfile = 1
    selops.pop(0)
else:
    outfile = -1
    print(f"{infile} -> {outfile}")

      0


1             

              
             2


3             

              
       4
"""

# if __name__ == "__main__":
parser = argparse.ArgumentParser()
parser.add_argument("--landscape", action="store_true")
parser.add_argument("--crop-margins", help="l t r b")
parser.add_argument("--pages", help="pages to include") # how about a not-pages
parser.add_argument("--gs-path", help="Path to gs executable", default="pdfcrop")
parser.add_argument("--pdfcrop-path", help="Path to pdfcrop executable", default="pdfcrop")
parser.add_argument("--pdfnup-path", help="Path to pdfnup executable", default="pdfnup")
args = parser.parse_args()

