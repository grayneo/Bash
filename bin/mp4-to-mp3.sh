#! /bin/bash
clear
 IFS=$'\n'
# read -p " Set location: " location
# cd $location

# read -p "are you sure about  location $location ? (y/n):  " test
# if  [ $test != "y"  ] ;then
#     exit
# fi

ls -1 | grep .mp4 > ls.txt
cat  ls.txt | sed -e "s/.mp4$//g" > ex.txt

 while read -r a && read -r b <&3; do
 ffmpeg -i "$a" -b:a 192K -vn "$b.mp3"
 done < ls.txt 3< ex.txt

# ffmpeg -i ~/Music/$filename -b:a 192K -vn ~/Music/$name.mp3
