echo "Welcome to flip coin combination"

declare -A flipCoin
IS_HEAD=1
counter=0
TTTCount=0
HHHCount=0
HHTCount=0
HTTCount=0
THTCount=0
TTHCount=0
HTHCount=0
THHCount=0
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
		if [ ${flipCoin[$counter]} == 'HHH' ]
		then
			((HHHCount++))
		elif [ ${flipCoin[$counter]} == 'HTT' ]
		then
			((HTTcount++))
		elif [ ${flipCoin[$counter]} == 'HHT' ]
		then
			((HHTCount++))
		elif [ ${flipCoin[$counter]} == 'HTH' ]
		then
			((HTHCount++))
		elif [ ${flipCoin[$counter]} == 'THT' ]
		then
			((THTCount++))
		elif [ ${flipCoin[$counter]} == 'TTH' ]
		then
			((TTHCount++))
		elif [ ${flipCoin[$counter]} == 'THH' ]
		then
			((THHCount++))
		elif [ ${flipCoin[$counter]} == 'TTT' ]
		then
			((TTTCount++))
		fi
		((noOfCoinFlip++))
	done
	((counter++))
done 

#Percentage of  head
percnetageOfHead=$(((($HHHCount)*100)/$noOfTime))
echo "Percentage of head " $percnetageOfHead
percnetageOfHHT=$(((($HHTCount)*100)/$noOfTime))
echo "Percentage of HHT " $percnetageOfHHT
percnetageOfHTH=$(((($HTHCount)*100)/$noOfTime))
echo "Percentage of HTH " $percnetageOfHTH
percnetageOfHTT=$(((($HTTCount)*100)/$noOfTime))
echo "Percentage of HTT " $percnetageOfHTT
percnetageOfTTT=$(((($TTTCount)*100)/$noOfTime))
echo "Percentage of TTT " $percnetageOfTTT
percnetageOfTTH=$(((($TTHCount)*100)/$noOfTime))
echo "Percentage of TTH " $percnetageOfTTH
percnetageOfTHH=$(((($THHCount)*100)/$noOfTime))
echo "Percentage of THH " $percnetageOfTHH
percnetageOfTHT=$(((($THTCount)*100)/$noOfTime))
echo "Percentage of THT " $percnetageOfTHT
