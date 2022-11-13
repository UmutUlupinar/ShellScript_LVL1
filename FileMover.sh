mkdir -p writable
arr=( * )
for (( i = 0 ; i < ${#arr[@]} ; i++ ))
do
	wildCard=`ls -l "${arr[$i]}"` 
	writability=${wildCard:2:1}
	if [ $writability = 'w' ] 
	then
		cp "${arr[$i]}" writable
        printf "Files to moved writable directory"
	fi
done