# Markdown to Latex Using APA 6 Style

If you have to use the American Psychological Association Style version 6 (apa6) then this package of templates and scripts might be just what you need.

Using the style if you have to do it manually in Word is a pain. These templates and scripts allow you to automatically generate apa6 compliant documents with the minimum of fuss and effort. Your citations are also created and formatted properly.

## The Process

These templates and scripts use Markdown as the document markup language, they then convert the Markdown document to LaTeX and run biber to format the bibliography and citations and finally convert the whole document to a properly formatted PDF. That means that you need some software installed on your system before you can begin.

## Pre-Requisites

The set up is the most time consuming thing about this package. Once you have set up your system then creating documents is quick and simple. You need to be able to issue simple commands at the terminal but most people can manage to do that.

This set up is tested to work on MacOS 10.8.2 using Pandoc 1.11.1 . It will no doubt work on Linux with perhaps minor mods to the paths in the scripts. It will also probably work on Windows using a shell emulator. I don't know about Windows so you are on your own there!

First you need to install [Pandoc](http://johnmacfarlane.net/pandoc/installing.html) . It's quick and simple and once installed it's seamless to run. Once you have installed you should open Terminal and at the prompt type `pandoc --version` to check that you have a good install. If Pandoc tells you its version number you are good to go.

Now you need to install a LaTeX distribution. This is a bigger job - the distributions are quite large. [Here's](http://tug.org/mactex/) a good Mac distribution. There are distributions for other platforms.

Make a cup of coffee and set the install running. Once you have LaTeX installed find the TeX Live Utility and launch it. Use it to install the `apa6` package. You will need this package to format your documents according to APA style.

Once you have all of those things ready you need to install these scripts.

## Installation

Either clone the Git repo off Bitbucket or download the zip file from the same location. Put the scripts into a directory which will be the directory you use to generate your documents. We'll call this `maindir`.

Take the `apa6template.tex` document and put it into `/usr/local/share/pandoc-1.11/data/templates/apa6template.tex` . That path will be slightly different if you have a different version of Pandoc installed. Modify it to suit.

There are now a number of files left in `maindir`:

- `abstract.md` is where you enter your document abstract
- `affiliations.md` is where you enter your affiliations for the title page
- `APATemplate.md` is a Markdown template that is set up for you to use to actually write your document. Copy and rename it to use if for your own document.
- `shorttitle.md` is where you enter the short title for your document
- `keywords.md` which is where you enter your document keywords.
- `createpdf.sh` is a script which you will use to create your final PDF document. It runs PDFLaTeX and biber multiple times to create the document, the citations and the bibliography.
- `md2pdf.sh` creates a PDF but doesn't run multiple passes or run biber. It is for doing a quick document generate to check formatting and maths.
- `md2tex.sh` takes your Markdown document and generates a LaTeX document from it. This is useful if you want to debug problems in your document.
- `tex2pdf.sh` is the script that you'd use after you used the previous script. For instance if you made mods to the tex file you could then convert to PDF using this script.
- `cleantex.sh` when you run the build command LaTeX creates all sorts of additional files in `maindir`. Sometimes you feel like you'd like to clean those files up. Sometimes you find aberrant behaviour - particularly when you are debugging a .tex file. This script can help be removing much of the detritus from `maindir`. Use with care and have a look at it and comment out any file types you don't want removed.

You need to have a bibliography file in `maindir`. The name of this file is set in `apa6template.tex`. Currently it is set to `bibliography.bib` you can either call your `.bib` file that or modify the template to suit the name of your `.bib` file. If you need a bibliography app, google for Jabref.

You should open Terminal and cd to `maindir` then run `chmod 755 *.sh` this will ensure that your scripts are executable.

## Using the Scripts

Here's the short version:

1. Copy the `APATemplate.md` document and write your document in the copy you've made.
1. Populate the keywords, affiliations, abstract and shorttitle documents.
1. When you have your document ready in `maindir` create a PDF of it by running `./createpdf.sh` from within `maindir`. This will create various files in `maindir` most of which don't matter. The two files you are interested in are the file called `yourfilename.tex` and `yourfilename.pdf`.

Now the long version.

### Your Markdown Document

The first three lines of the Markdown template are meta data that is passed into the apa6template.tex document by Pandoc. You need to ensure that these are the first three lines in the document with no blank space before or between them.

The content of these lines is:

1. The document title
1. The Author or Authors names
1. The format of the final document. This has three options: `man` is the manuscript version of APA 6 style, `doc` is a plain document format and `jou` is the two column journal style. Set this parameter to suit your current purpose.

You can enter either [Markdown](http://code.ahren.org/markdown-cheatsheet) format text or verbatim LaTeX or a mixture of both. The ability to enter verbatim LaTeX is important, particularly if you need to include formulas and other maths in your document. Pandoc will pass it through unchanged...with a couple of exceptions.

If you want to set in-line maths then you need to escape the slashes in the environment like this: `\\(...\\)` the additional `\` gets stripped on the way through. If you want to set display maths then the same applies `\\[...\\]`.

However if you are just setting up another environment you don't need to double escape:

	\begin{equation}
	...
	\end{equation}

Will work just fine. Similarly if you set up some other environment and then put display or inline maths inside that environment you *don't* need to double escape it. So:

	\begin{APAenumerate}
	\item Some text with maths \(...\)
	\end{APAenumerate}

Will work fine too.

Have a good read of the PDF document that is installed with the apa6 package using the TeX Live Utility. You can access it by finding the apa6 package and then double clicking it and then clicking the PDF. It tells you all about the capabilities of the package and how to use them.

### Running Head on Title Page

If you *don't* want a running head on the title page then find this text in the preamble of the `apa6template.tex` document:

	
	\fancypagestyle{titlepage}{%
	  \lhead{}%
	   \rhead{\thepage}%
	}

Make sure it is *not* commented.

If you *do* want a running head on the title page of your manuscript - as per strict APA 6 Style then *comment out* the above text.

## Issue resolution & Bugfixes

### Issue 1

A necessary file `rgb.tex` was missing from the distribution. It has now been added. It should be placed in `maindir`.

### Issue 2

Added `\usepackage{fancyhdr}` to `apa6template.tex`.

### Issue 3

This issue arose as a discussion about the use of Pandoc citations as opposed to using LaTeX style citations as verbatim LaTeX. One of the users explored the issue and the findings are contained in [this discussion.](https://bitbucket.org/zuline/md2latex/issue/3/pandoc-citations-not-supported)

The bottom line is that the best outcomes will likely be achieved by using the LaTeX citation approach not the Pandoc citation approach.

