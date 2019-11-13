#!/bin/bash -x

echo "Welcome Gambler"

read -p "Enter number of days : " Days
read -p "How many times do you want to play : " play

stake=100;
bet=0;
cash=100;
win=1;
stakeMax=0;
stakeLow=0;
totalStake=0;
totalWin=0;
totalLose=0;
totalCashWin=0;
totalCashLose=0;
perDayWin=0;
perDayLose=0;
luckyDay=0;
unluckyDay=0;
luckiestDay=0;
unluckiestDay=0;

function stakePercentage () {
	stakeMax=$(( $stake + $stake / 2 ))
	stakeLow=$(( $stake / 2 ))
}
function Gamble() {
for (( counter=0; counter<$Days; counter++ ))
do
	while [ $bet -ne $play  ]
	do
		bet=$(( $bet + 1 ))
		randomCheck=$(( RANDOM%2 ))
		if [ $randomCheck -eq $win ]
		then
			stake=$(( $stake + 1 ))
         if [ $stake == $stakeMax ]
			then
				break
			fi
		else
			stake=$(( $stake - 1 ))
			if [ $stake == $stakeLow ]
			then
				break
			fi
		fi
	done
	cal=$(( $stake - 100 ))

	if [ $cal -gt $luckiestDay ]
	then
		luckyDay=$counter
		luckiestDay=$cal
		echo "Day" $counter
		echo "lucky Day" $cal
	fi

	if [ $cal -lt $unluckiestDay ]
	then
		unluckyDay=$counter
		unluckiestDay=$cal
		echo "Day" $counter
		echo "unlucky Day" $cal
	fi

	if [ $cal -gt 0 ]
	then
		totalWin=$(( $totalWin + 1 ))
	else
		totalLose=$(( $totalLose + 1 ))
	fi

	bet=0
	totalStake=$(( $totalStake + $stake ))
done

echo $totalStake

totalDayStake=$(( $cash * $Days ))

if [ $totalStake -gt $totalDayStake ]
then
	totalCashWin=$(( $totalStake - $totalDayStake ))
else
	totalCashLose=$(( $totalDayStake - $totalStake ))
fi
echo "lucky Day" $luckiestDay
echo "unlucky Day" $unluckiestDay
}
function toContinueOrNot()
{
 if [ $totalCashWin -gt 0 ]
 then
    temp=2000;
    while [ $temp != 0  ]
    do  
      read -p "For continue Press 1 for YES or Press 0 for NO :" choice
      yes=1;
      no=0;
      case $choice in $yes )
         for (( i=0; i<=1; i++ ))
         do
         stakePercentage
         Gamble
         done;;
                    $no )
         break;;
      esac
    done
 fi  
}
stakePercentage
Gamble
toContinueOrNot
