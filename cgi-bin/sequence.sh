#! /bin/bash

#Run a song, then wait 5 minutes
#import csv of song names and mp3's
declare -a song_name=(fight_song.txt carol.txt jbr.txt HollyJolly.txt)
declare -a song_music=(cfs-short.mp3 Carol.mp3 jingle_bell_rock.mp3 HollyJollyXmas.mp3)
declare -i iCounter
iCounter=0

#OLDIFS=$IFS
#IFS=","
#while read title song
#do
#  # echo -e "\e[0m$title "
#  song_name[iCounter]=$title
#  song_music[iCounter]=$song
#  iCounter=iCounter+1
#done < $1
#IFS=$OLDIFS

echo ${song_name[@]}
echo ${song_music[@]}

# declare -i arr_length
# arr_length=3
# echo $arr_length
# declare -i iCount
# iCount=0
arr_length=${song_name[@]}
echo arr_length
declare -i iCount
iCount=0
while true; do
  #get the array of songs
  echo "iCount: $iCount"
  echo "Array Length: $arr_length"
  echo "Start of the while"
  #read the next value in the array to a variable
  name=${song_name[iCount]}
  music=${song_music[iCount]}
  echo $name
  echo $music

  #play the song and sequence
  #turn everything off on the tree
  /var/www/html/cgi-bin/treeoff.sh
  /var/www/html/cgi-bin/xmas.py /var/www/html/cgi-bin/$name /var/www/html/cgi-bin/$music
  /var/www/html/cgi-bin/treeon.sh
  #sleep for 5 minutes
  sleep 2m
  if [[ "$iCount" == "$arr_length" ]];then
    iCount=0
  else
    iCount=iCount+1
  fi


done
