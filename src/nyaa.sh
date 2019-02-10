function SearcherNyaa(){
link="https://nyaa.si/?f=0&c=0_0&q=$1&s=seeders&o=desc"
oIFS=$IFS
IFS=$'\n'
tempname=/tmp/$RANDOM
curl --compressed -s "$link" > "$tempname"
title=(`cat $tempname|grep "/view/"|grep -v "#comments"|cut -d'"' -f4`)
seed=(`cat $tempname|grep "color: green"|cut -d'>' -f2|cut -d'<' -f1`)
size=(`cat $tempname|grep "iB</"|cut -d'>' -f2|cut -d'<' -f1`)
torrent=(`cat $tempname|grep "torrent"|grep -v "torrent-list"|cut -d'"' -f2|sed s,"/download","https://nyaa.si/download",g`)

for i in "${!title[@]}"; do 
	printf 'Title:\t%s\nSize:\t%s\nSeeder:\t%s\nTorrent:\t%s\n\n\n'	${title[$i]}	${size[$i]}	 ${seed[$i]} ${torrent[$i]}
done | less
IFS=$oIFS

rm $tempname
}
