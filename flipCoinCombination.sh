#! /bin/bash -x
declare -A flipCoin
ishead=1
counter=0
headCount=0
tailCount=0
read -p " How many times to flip : " noofTime
while [ $counter -lt $noofTime ]
do
	flip=$(($RANDOM%2))
	echo $flip
	if [ $flip -eq $ishead ]
	then
		echo " Head "
		flipCoin[$counter]="Head"
		((headCount++))
	else
		echo " Tail "
		flipCoin[$counter]="Tail"
		((tailCount++))
	fi
	((counter++))
done
percentageHeads=$(((($headCount)*100)/$noofTime))
echo "percentage pf heads " $percentageHeads
percentageTails=$((100-$percentageHeads))
echo "percentge of tails " $percentageTails

