#!/binbash

while read line; do
	sh /raid/modencode/DCC/fileupload/makeBigWigs.sh /raid/modencode/dm/processing/$line/wig
done < "$1" 
