#!/bin/bash
IFS=$'\n'
ls -1 *.rar > /tmp/lsrar.txt
ls -1 *.zip > /tmp/lszip.txt
ls -1 *.7z* > /tmp/ls7z.txt
clear
##
rarpass(){
name=$1
while read line; do
        name=$line
            
        unrar x -o+ -p$pass $name
        rm  $name
             done < /tmp/lsrar.txt
}
##
rar () {
name=$1
while read line; do
        name=$line
            
        unrar x -o+ $name
        rm   $name
             done < /tmp/lsrar.txt
}
###
rarfile (){

read -p "files have password?(y/n): " ans 
if [ $ans == "y" ] ;then
read -p "enter file password: " pass
rarpass
elif [ $ans == "n" ];then
rar
else 
 exit
fi
}
###
7zfile (){
name=$1
while read line; do
        name=$line
            
        7za x $name && rm  $name
             done < /tmp/ls7z.txt
}
##

zipfile (){

name=$1
while read line; do
        name=$line
        unzip  $name 
        rm  $name
             done < /tmp/lszip.txt
}
##
tmpclean (){
 rm /tmp/ls*.txt
}

read -p "choose your file formant enter like this (7z or zip or rar): " format
if [ $format == "rar" ] ;then
    rarfile
    tmpclean
elif [ $format == "zip" ];then
    zipfile
    tmpclean
elif [ $format == "7z" ];then
    7zfile
    tmpclean
else
 tmpclean
 exit
fi

