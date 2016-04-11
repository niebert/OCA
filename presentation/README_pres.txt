% Content of Presentation Folder
% Name: Engelbert Niehaus
% Date: April 10th, 2016


Folders & Organisation
----------------------

The list describes the purpose of these folders and 
provides a small survey about the files that are stored in these folders:

* <b>reveal:</b> Presentation Libraries (<https://github.com/hakimel/reveal.js>).
* <b>mathjax:</b> Render Mathemematical Formulas (<https://github.com/mathjax/MathJax>).
* <b>pandoc4OCA:</b> Convert Markdown and Wikipedia file into Reveal
* <b>mypresentation:</b> Media files for the reveal presentation "mypresentation.html"


Folder reveal:
-------------

* Contains all the files that allows the use of all features of the reveal
project. 
* The libraries created by Hakim El Hattab are embedded in all the reveal 
presentations. 
* The content of the "reveal" folder can be replaces by newer versions
of "reveal.js" 
* URL: <https://github.com/hakimel/reveal.js>

Folder  mathjax: 
----------------

* In standard [reveal.js](https://github.com/hakimel/reveal.js) presentations mathematical formulas are rendered 
with MathJax by importing the MathJax libraries via internet access. 
* This has the disadvantage that mathematical formulas are not rendered, when you 
do not have internet connectivity or the MathJax libraries are removed from the
browser cache. 
* The local MathJax libraries avoid these problems.
The content of the "mathjax" folder can be replaces by newer versions
of "MathJax" 
* URL: <https://github.com/mathjax/MathJax> 
* Homepage: <http://www.mathjax.org>

Folder pandoc4OCA:
------------------

* Provides Scripts to create reveal-presentation from MarkDown
and Wikipedia Content by application of the OpenSource document conversion tool
pandoc. 
* Provides the Template _tpl4reveal.html_ that is used for the reveal presentation

Folder mypresentation:
----------------------

* contains all media files (Video, Audio, Images, ...) that are used in the reveal presentation.
* Recommendation: Use the same directory name as the name for the reveal presentation.
* e.g. for "_mypresentation.html_" use as media directory "_mypresentation_"

Commands for MarkDown
---------------------

* The file *README_pres.txt* is e.g. a text file in MarkDown and converted into Reveal.
* The following PanDoc command creates a reveal presentation from Markdown.

```
pandoc -t html5 --template=tpl4reveal.html \
      --standalone --section-divs \
      --variable theme="beige" \
      --variable transition="slide" \
      slides.md -o slides.html
```

Commands for WikiMedia
----------------------

* Source Files from Wikipedia (e.g. Edit Article) can be retrieved and stored as text file.
* The following PanDoc command creates a reveal presentation from the Wikipedia file _"wikipedia.wiki"_.

```
pandoc -f mediawiki -t html5 --template=tpl4reveal.html \
     --standalone --section-divs \
     --variable theme="beige" \
     --variable transition="slide" --mathjax \
     wikipedia.wiki -o wikipedia.html 
```

Scripts for MarkDown and WikiMedia
----------------------------------

Copy a file into the _pandoc4OCA_ folder an run the following scripts:

* for MarkDown to Reveal conversion:
```
sh md2reveal.sh mysource.md
```
* for Wikipedia Source to Reveal conversion:
```
sh wiki2reveal.sh mysource.wiki
```
Install pandoc on Linux or Mac and run shell script from terminal

Learning Markdown & WikiMedia
-----------------------------

* Learning Markdown <http://www.markdowntutorial.com>
* Learning WikiMedia <https://en.wikipedia.org/wiki/Wikipedia:Tutorial>
