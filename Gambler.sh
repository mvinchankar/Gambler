#!/bin/bash -x

echo "Welcome Gambler"

read -p "Enter number of days : " Days
read -p "How many times do you want to play : " play

stake=100;
bet=0;
cash=0;
win=1;
stakeMax=0;
stakeLow=0;
totalStake=100;
totalWin=0;
totalLose=0;
totalCashWin=0;
totalCashLose=0;
dayWin=0;
dayLoss=0;
cash1=100;
bets=0;
function limit () {
	stakeMax=$(( $cash + $cash / 2 ))
	stakeLow=$(( $cash / 2 ))
}

function bet() {
 for (( counter=1; counter<=$Days; counter++ ))
 do
        
        cash=$(( $cash + $totalStake ))  
        limit $cash
        while [ $bets != $play ]
	do	
                bets=$(($bets+1))
		if [ $(( RANDOM%2 )) -eq $win ]
		then
		   cash=$(( $cash + 1 ))  
                   if [ $cash == $stakeMax ]
	           then
			break
		   fi
	       	else
		  cash=$(( $cash - 1 ))
		  if [ $cash == $stakeLow ]
		  then
			break
		  fi
		fi
        
	done
        cal=$(( $stake - 100 ))
        if [ $cal -gt 0 ]
	then
		totalWin=$(( $totalWin + 1 ))
	else
		totalLose=$(( $totalLose + 1 ))
	fi
        bets=0;

		if [ $cash -eq $stakeMax ]
		then
			totalWin=$(( $totalWin + 1 ))
		fi

		if [ $cash -eq $stakeLow ]
		then
			totalLose=$(( $totalLose + 1 ))
		fi
         
        if [ $cash -gt $totalStake ]
        then 
            dayWin=$(($dayWin + 1))
            echo DayWin:$dayWin
        else
            dayLoss=$(($dayLoss + 1))
            echo DayLoss:$dayLoss
        fi
echo TotalWin:$totalWin
echo TotalLose:$totalLose
done
totalGamblePerform=$(( $cash ))
echo TotalGamblePerform:$totalGamblePerform


totalDayStake=$(( $cash1 * $Days ))

if [ $totalGamblePerform -gt $totalDayStake ]
then
	totalCashWin=$(( $totalGamblePerform - $totalDayStake ))
        echo TotalCAshWin$totalCashWin
else
	totalCashLose=$(( $totalDayStake - $totalGamblePerform))
        echo TotalCashLoss$totalCashLose 
fi
}
limit 
bet
