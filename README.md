Manual de Periodismo de  Datos
==============================

Este repositorio contiene los archivos fuente del Manual de Periodismo de Datos. El manual empezó
en el Mozilla Festival 2011 como colaboración entre 70 expertos, coordinatos por el European Journalism Center
y la Open Knownledge Foundation.

La Nación DATA patrocinó la traducción al español del Manual.

How to build the DDJBook
------------------------

* Install Python libraries "lxml" and "jinja2", possibly into a virtualenv
* Install [Jekyll](https://github.com/mojombo/jekyll/)
* Checkout the repo on "master"
* Convert the book to docbook, e.g. asciidoc --backend docbook book.asc
* Run "python jekyllify.py" to convert the outcoming book HTML into a
Jekyll site
* Go into the "web" directory
* Run "jekyll" (or "jekyll --auto --server" during development)

This will generate the new site, based on the templates in
web/_layouts/default.html
