#! bin/bash
#usage : sh maketracks.sh <file with dirnames and gene names> <tracknumber to startwith>
tracknum=$(($2-1))
while read line; do
	IFS=$'\t' read -a array <<< "$line"
	dirname="${array[0]}"
	genename="${array[1]}"

	for filename in /raid/modencode/dm/processing/$dirname/wig/$genename*IP_Rep0*Input*.bw; do
	
		tracknum=$((tracknum + 1))
		echo "track flyTrack$tracknum"
		echo "compositeTrack on"
		echo "visibility full"
#		echo "bigDataUrl" $filename
		#replace pattern at the beginning of string
		echo "bigDataUrl" ${filename/#\/raid\/modencode\/dm\//}
		#replace pattern at the end of string
#		echo "${filename/%Rep*/Rep}"
#		index=`echo $filename | grep -bo "Rep" | cut -d: -f1`
#		index=$((index+4))
		slbl=${filename/#\/raid\/modencode\/dm\/processing\/$dirname\/wig\//}
#	${var//12345678/$replace}
		slbl=${slbl//.bw/}
		echo "shortLabel" ${slbl//.tagAlign/}
		echo "longLabel" ${filename/#\/raid\/modencode\/dm\/processing\/$dirname\/wig\//}
	#	echo "shortLabel" ${filename:0:$index}
	#	echo "longLabel" ${filename:0:$index}.bw
		echo "type bigWig"
		echo 
#	strindex() { 
 # 	x="${1%%$2*}"
  #	[[ $x = $1 ]] && echo -1 || echo ${#x}
#	}
	#echo ${filename%%/dm/}
	done

done < "$1"


