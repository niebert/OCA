#!/bin/sh
echo "Convert WikiMedia to Reveal"
echo "---------------------------"
s="$1"
outfile="$2"
# echo ${s##*/}
s=${s##*/}
# echo ${s%.*}
s=${s%.*}
if [ -z "$1" ]
  then
    echo "$0: MarkDown source file is not defined."
	echo "Call:" 
	echo "   $0 infile.wiki outfile.html"
	echo "or:"
	echo "   $0 infile.wiki "
    exit 1
fi
if [ -z "$2" ]
  then
    # echo "$0: destination file for reveal presentation is not defined." 
    outfile="../$s.html"
    # echo "Outfile set to: $outfile"
    #exit 1
fi
echo "Source File:      $1"
echo "Destination File: $outfile"
# pandoc -t html5 --template=tpl4reveal.html --standalone --section-divs --variable theme="beige" --variable transition="slide" $1 -o $outfile
pandoc -f mediawiki -t html5 --template=tpl4reveal.html --standalone --section-divs  --variable theme="beige"  --variable transition="slide" --mathjax  $1 -o $outfile 
