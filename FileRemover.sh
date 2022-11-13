counter=0

if [ $# -eq 1 ] #if argument only contains wildcard
then
	arr=( * ) #insert all files in current directory to array
	for (( i = 0 ; i < ${#arr[@]} ; i++ ))
	do		
		if [[ ${arr[$i]} == $1 ]] 
		then 
			if [[ -d ${arr[$i]} ]];			#if file is a directory
			then
				continue
			fi
			read -p "Do you want to delete ${arr[$i]} (y/n) " var #asks user to delete the file
			if [ $var = 'y' ]
			then
				rm ${arr[i]}
				counter=$((counter+1))

			elif [ ! $var = 'n' ]
			then
				echo "Your options are y or n "			
			fi

			
		fi
		
		
	done
	
#-----------------------------------------------------------------
elif [ $# -eq 2 ] #if argument contains wildcard and path
then	
	
	if [ $2 = "." ] || [ ${2:0:1} = "/" ] #checks if second argument is a path
	then
	cd $2
		array=()
		while IFS=  read -r -d $'\0'; do
			array+=("$REPLY")
		done < <(find . -name "$1" -print0)
		
	else 
		echo "second argument must be path"
		exit
	fi
	for (( i = 0 ; i < ${#array[@]} ; i++ ))
	do
		read -p "Do you want to delete ${array[$i]} (y/n) " var
			if [ $var = 'y' ]
			then
				rm ${array[i]}
				counter=$((counter+1))

			elif [ ! $var = 'n' ]
			then
				echo "Your options are y or n "			
			fi
	done
		
else 
	echo "There could only be wildcard and argument"
fi

echo "$counter file deleted"