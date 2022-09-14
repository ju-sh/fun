"""
Requires Python>=3.6
"""

import argparse
import os
import pathlib
import subprocess
import tempfile

"""
select pages: gs
crop borders: pdfcrop
landscape/portrait: pdfnup

cmds:
 - gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -sPageList=$ARG -sOutputFile=$INFILE $OUTFILE
 - pdfcrop --margins $ARG $INFILE $OUTFILE
 - ./pdfnup --nup $LAYOUT $INFILE -o $OUTFILE --landscape
"""

CMDS = {
    "gs": ("{gs} -sDEVICE=pdfwrite -dNOPAUSE -dBATCH"
           "-sPageList={pages} sOutputFile={inp} {outp}"),
    "pdfcrop": "{pdfcrop} --margins {margins} {inp} {outp}",
    "pdfnup": "{pdfnup} --nup {layout} {inp} -o {outp} {landscape}"
}


def dispatch_cmd(op: str, args, inp: str, outp: str) -> None:
    cmd = ""
    if op == "gs":
        cmd = CMDS["gs"].format(gs=args.gs_path,
                                pages=args.pages,
                                inp=inp,
                                outp=outp)
    elif op == "pdfcrop":
        cmd = CMDS["pdfcrop"].format(pdfcrop=args.pdfcrop_path,
                                     margins=args.crop_margins,
                                     inp=inp,
                                     outp=outp)
    elif op == "pdfnup":
        landscape = ""
        if args.landscape:
            landscape = "--landscape"
        cmd = CMDS["pdfnup"].format(pdfnup=args.pdfnup_path,
                                    layout=args.layout,
                                    inp=inp,
                                    outp=outp,
                                    landscape=landscape)
    if args.dry:
        print(cmd)
    else:
        subprocess.run(cmd.split())
    


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("input")
    parser.add_argument("output")
    parser.add_argument("--landscape", action="store_true")
    parser.add_argument("--layout", help="Like 2x1")
    parser.add_argument("--crop-margins", help="l t r b")
    parser.add_argument("--pages", help="pages to include") # how about a not-pages
    parser.add_argument("--gs-path", help="Path to gs executable", default="gs")
    parser.add_argument("--pdfcrop-path", help="Path to pdfcrop executable", default="pdfcrop")
    parser.add_argument("--pdfnup-path", help="Path to pdfnup executable", default="pdfnup")
    parser.add_argument("--dry", action="store_true", help="Do a dry run")
    args = parser.parse_args()

    # Queue up the selected operations
    ops = []
    if args.pages:
        ops.append("gs")
    if args.crop_margins:
        ops.append("pdfcrop")
    if args.layout:
        ops.append("pdfnup")

    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdirpath = pathlib.Path(tmpdir)
        files = [args.input, tmpdirpath / "temp1.pdf",
                 tmpdirpath / "temp2.pdf"]

        # idx into files list
        inpidx = 0
        outidx = 1  

        for op in ops[:-1]:
            # infile -> outfile
            dispatch_cmd(op, args, files[inpidx], files[outidx])

            inpidx = outidx
            if outidx == 1:
                outidx = 2
            else:
                outidx = 1
        else:
            # infile -> outfile
            dispatch_cmd(ops[-1], args, files[inpidx], args.output)
