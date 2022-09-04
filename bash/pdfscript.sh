# https://askubuntu.com/a/1360466

# remove pages by range: 1-2,3,5,6-8
#   what about 1-2,4,2-4
#   what about 1,1
# landscape/portrait option to pdfnup
# outfile
# tempfile name (default: ./.temp.pdf)
# infile
# inplace (in which case CROPPED,INFILE,OUTFILE would be same
# margin (single val or ltrb)
#   ie, 10
#       10 15 10 15
# number of pages (default 2x1)
#
# getopt input.pdf output.pdf [--landscape]

#INFILE="in.pdf"
#CROPPED="cropped.pdf"
#OUTFILE="outnx1.pdf"
#pdfcrop --margins 10 $INFILE $CROPPED
#./pdfnup --nup 2x1 $CROPPED -o $OUTFILE --landscape

DEBUG=

# Handle optional arguments
LANDSCAPE=
PAGES=
CROPPED=./cropped.pdf
SELECTED=./selected.pdf
LAYOUT="2x1"
GETARGS=$(getopt -o 'r:o::' -l 'margins:,pages:,layout:,landscape::' -- $@) || exit
eval "set -- $GETARGS"

while true; do
   case $1 in
   (--margins)
        MARGINS=$2
        shift 2;;
   (--layout)
        LAYOUT=$2
        shift 2;;
   (--pages)
        PAGES=$2
        shift 2;;
   (--landscape)
        LANDSCAPE=1
        shift 2;;
   (--)
      # opt args parsed
      shift
      break;;
   *)
      echo "Uh-oh.. Something went wrong.."
      exit 1;
   esac
   #shift 2
done;

echo "REMARGS: $@"

function echoyn {
    if [ $1 ]; then
        echo $1
    else
        echo "N"
    fi
}

if [ $# -lt 2 ]; then
    echo "Not enough positional args"
    exit 1
fi

INFILE=$1
OUTFILE=$2

# select: in ->
# crop:  ->
# layout: -> out

# Use only selected pages if needed if needed
if [ $PAGES ]; then
    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -sPageList=$PAGES -sOutputFile=$INFILE $SELECTED > /dev/null
else
    SELECTED=$INFILE
fi

# Crop if needed
if [ $MARGINS ]; then
    pdfcrop --margins $MARGINS $SELECTED $CROPPED
else
    CROPPED=$SELECTED
fi

if [ $LANDSCAPE ]; then
    ./pdfnup --nup $LAYOUT $CROPPED -o $OUTFILE --landscape
else
    ./pdfnup --nup $LAYOUT $CROPPED -o $OUTFILE
fi

# Clean up
rm -f $CROPPED $SELECTED
