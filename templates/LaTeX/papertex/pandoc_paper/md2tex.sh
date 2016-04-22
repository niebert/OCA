#!/bin/bash
echo "--------------------------------------------"
echo "    CREATE EasyChair File with PanDoc"
echo "--------------------------------------------"
echo " "
pandoc abstract.md -o tmp/abstract.tex
pandoc title.md -o tmp/title.tex
pandoc shorttitle.md -o tmp/shorttitle.tex
pandoc keywords.md -o tmp/keywords.tex
pandoc paper.md -o tmp/paper.tex
title=$(cat tmp/title.tex)
shorttitle=$(cat tmp/shorttitle.tex)
abstract=$(cat tmp/abstract.tex)
keywords=$(cat tmp/keywords.tex)
paper=$(cat tmp/paper.tex)
easychair0=$(cat ./tpl/easychair0.tex)
easychair1=$(cat ./tpl/easychair1.tex)
easychair2=$(cat ./tpl/easychair2.tex)
easychair3=$(cat ./tpl/easychair3.tex)
easychair4=$(cat ./tpl/easychair4.tex)
echo "--------------------------------------------"
echo "TITLE:       $title"
echo "SHORT TITLE: $shorttitle"

authorsfile=$(cat authors.txt | tr " " "_")
attribname=( Name eMail Affiliation Thanks )
attribvalue=( name email affil thank) 
authorrunningOUT=""
authorOUT="\\author{"
affiliOUT="\\institute{"
CR=""
COMMA=""
count=0
for line in $authorsfile; do
	let count=count+1 
	echo "--${count}-----------------------------------------"
    echo "LINE> [$line]"
	arr=$(echo $line | tr "|" "\n")
	i=0
	for x in $arr
	do
		outvar=$(echo $x | tr "_" " ")
		#outvar=$x
		echo "${attribname[$i]}> [$outvar]"
		attribvalue[$i]="$outvar"
		i=$((i+1))
	done
	authorrunningOUT="${authorrunningOUT}${COMMA}${attribvalue[0]}" 
	authorOUT="${authorOUT} 
	    $CR 
	    ${attribvalue[0]}\\inst{${count}}\\thanks{${attribvalue[3]}}"
	affiliOUT="${affiliOUT}
	$CR 
	   ${attribvalue[2]} \\\\
	   \\email{${attribvalue[1]}}"
	CR="
  \\and"
   COMMA=", "
done
echo "--------------------------------------------"

authorOUT="${authorOUT}
}

% Institutes for affiliations are also joined by \\and,"
affiliOUT="${affiliOUT}
}
%  \authorrunning{} has to be set for the shorter version of the authors' names;
% otherwise a warning will be rendered in the running heads. When processed by
% EasyChair, this command is mandatory: a document without \authorrunning
% will be rejected by EasyChair

\authorrunning{${authorrunningOUT}}

% \titlerunning{} has to be set to either the main title or its shorter
% version for the running heads. When processed by
% EasyChair, this command is mandatory: a document without \titlerunning
% will be rejected by EasyChair
\titlerunning{${shorttitle}}

"

#echo "$authorOUT" >> authorout.tex
#echo "$affiliOUT" >> affiliationout.tex
#echo "$authorOUT" 
#echo "$affiliOUT" 
#echo "$paper"

echo "${easychair0} $title ${easychair1}

${authorOUT}
${affiliOUT}
${easychair2}${abstract}${easychair3}
${paper}
${easychair4}" >> ../paper.tex

