num=$1 

#--------------------------------------
if [ $# -ne 1 ]	
then
	echo "please enter 1 argument"
	exit
fi

#---------------checking the argument
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; 
then
   echo "argument must be a number" >&2; exit
fi
#---------------------------------------

m=2
for a in $(seq $m $1)
do
    k=0
    for i in $(seq 2 $(expr $a - 1))
    do 
        if [ $(expr $a % $i) -eq 0 ]
        then
            k=1
            break
        fi
    done
    if [ $k -eq 0 ]
    then
    printf "Hexadecimal of $a is"
  	printf " %x\n" $a
    fi
done