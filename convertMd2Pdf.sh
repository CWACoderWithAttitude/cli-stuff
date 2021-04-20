#!/bin/sh -x

#
# filename: md2pdf.sh
#
# author: cwacodewithattitude@gmail.com
 
# purpose:
#   convert markdown to pdf. 
#   First version used markdown to pdf via pandoc (latex) but the result lacked tables with line separation.    
#   The detaout to asciidoctor fixes this.   
#
# license: MIT
# 
#echo Arg-Count $#
if [ "$#" -eq "1"  ]; then
 input_file=$1
fi
echo "input:  $input_file"
#exit
#return
#input_files=Stornierung_fluege.md

pandoc_image=pandoc/latex:2.6
image_asciidoctor=asciidoctor/docker-asciidoctor
output_format=asciidoc

for i in $input_files; do 
  filename=${i%.*}
  outname=$filename"."$output_format
  pdf_output=$filename"."pdf

  docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` $pandoc_image $i --to=$output_format -o $outname
  docker run --rm --volume "`pwd`:/documents" $image_asciidoctor asciidoctor-pdf $outname
done
