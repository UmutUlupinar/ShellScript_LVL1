strFile=$1
#checking paramater count 
if [ $# -ne 1 ]		
then
	echo "please enter 1 argument"
	exit
fi

#checking the file is exist
FILE=$strFile
if [ -f "$FILE" ]; then
  read -p "$strFile exists. Do you want it to be modified? (y/n):" yn
  case $yn in
        [Yy]* ) ;;
        [Nn]* ) exit;;
   esac
fi

#convert txt content to array of lines
while read p; 
do
	giris+=("${p}")
done <giris.txt

while read p; 
do
	gelisme+=("${p}")
done <gelisme.txt

while read p; 
do
	sonuc+=("${p}")
done <sonuc.txt

#take length of lines array
girisLength=${#giris[@]} 
gelismeLength=${#gelisme[@]} 
sonucLength=${#sonuc[@]} 

#creates number between 0 and length of lines array
first=$(( $RANDOM % $girisLength )); 
second=$(( $RANDOM % $gelismeLength ));
third=$(( $RANDOM % $sonucLength )); 

if [ $(expr $first % 2) -ne 0 ] ; then first=`expr $first - 1`
fi
if [ $(expr $second % 2) -ne 0 ] ; then second=`expr $second - 1`
fi
if [ $(expr $third % 2) -ne 0 ] ; then third=`expr $third - 1`
fi

echo "${giris[$first]}" > $1 #prints giriş.txt to output file
echo " " >>$1
echo "${gelisme[$second]}" >> $1 #prints gelişme.txt to output file
echo " " >>$1
echo "${sonuc[$third]}" >> $1 #prints sonuç.txt to output file

echo "A random story is created and stored in $1."