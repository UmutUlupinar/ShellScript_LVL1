strvar=$1 ; intvar=$2
#convert character to ascii code
toAscii() {
  LC_CTYPE=C printf '%d' "'$1"
}
# convert ascii code to character
toChar() {				
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}
length1=${#1} ; length2=${#2}
#------ Checking parameters count is 2
if [ $# -ne 2 ]		
then
	echo "please enter 2 argument"
	exit
fi

#----- Checking second parameter is an integer
re='^[0-9]+$'
if ! [[ $2 =~ $re ]] ; then
	echo "second argument must be an integer" >&2; 
	exit
fi


#------ Checking first parameter is string 
for ((i = 0 ; i < length1; i++))			
do
	chara=${strvar:i:1}
	varcheck=`toAscii $chara`
	if [[ $varcheck -le 90 && $varcheck -ge 65 ]] || [[ $varcheck -le 122 && $varcheck -ge 97 ]]
	then
		printf ""
	else
		echo "first argument should be a string"
		exit
	fi
done
#------- If second parameter's length
if [ $length2 -eq 1 ];	
then
	for (( i = 0 ; i < length1; i++ ))
	do

		x=${strvar:i:1}
		var=`toAscii $x`
		value=`expr $var + $2`
		if [ $var -le 90 ] && [ $value -ge 91 ]		
		then 
			value=`expr $value - 26`
		elif [ $var -le 122 ] && [ $value -ge 123 ]
		then 
			value=`expr $value - 26`
		fi
		lastvalue=`toChar $value`
		printf "$lastvalue"
	done
	printf "\n"

#-------Checking the length of parameters equality
elif [ $length2 -eq $length1 ];
then
	for (( i = 0 ; i < length1; i++ ))
	do
		x=${strvar:i:1}
		var=`toAscii $x`
		value=`expr $var + ${intvar:i:1}`
		if [ $var -le 90 ] && [ $value -ge 91 ]
		then 
			value=`expr $value - 26`
		elif [ $var -le 122 ] && [ $value -ge 123 ]
		then 
			value=`expr $value - 26`
		fi
		lastvalue=`toChar $value`
		printf "$lastvalue"
	done
	printf "\n"
else 
echo "arguments length must be equal or second arguments length must be 1"
fi
