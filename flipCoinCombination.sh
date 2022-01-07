echo "Welcome to flip coin combination"

declare -A flipCoin
IS_HEAD=1
counter=0
headCount=0
tailCount=0

read -p "How many times you want to flip coin " noOfTime

read -p "How many coins you want to flip at same time " noOfCoin

function flipCoinFunction(){

	flipCoinResult=$((RANDOM%2))
	#echo $flipCoinResult

	if [ $flipCoinResult -eq $IS_HEAD ]
	then
		echo "H"
	else
		echo "T"
	fi

}

while [ $counter -lt $noOfTime ]
do
	noOfCoinFlip=0
	while [ $noOfCoinFlip -lt $noOfCoin ] 
	do
		returnValueFromFunction=`flipCoinFunction`
		flipCoin[$counter]=`echo ${flipCoin[$counter]}$returnValueFromFunction`
		if [ ${flipCoin[$counter]} == 'HH' ]
		then
			((headCount++))
		else
			((tailCount++))
		fi
		((noOfCoinFlip++))
	done
	((counter++))
done 

#Percentage of  head
percnetageOfHead=$(((($headCount)*100)/$noOfTime))
echo "Percentage of head " $percnetageOfHead

#Percentage of tail
percentageofTail=$((100-$percnetageOfHead))
echo "Percentage of tail "$percentageofTail
