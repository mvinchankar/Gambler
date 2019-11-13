#!/bin/bash -x
echo Welcome Gambler
read -p "How Many Days you want to play" numberDays
totalAmount=0;
stake=100;
cash=100;
dayWin=0;
dayloss=0;
maxLimit=0;
lowLimit=0;
totalInvestment=0;
lossAmount=0;
winAmount=0;

function limitsOfStakes()
{
 maxLimit=$(($cash + $cash/2 ))
 lowLimit=$(($cash - $cash/2 ))
}

function bet()
{
 for(( j=1; j<=numberDays; j++ ))
 do 
  
    #read -p "How many times you want to play :" playTimes
    while [ $cash != 0 ] 
    do 
      bet=$((RANDOM%2))
      if [ $bet == 1 ]
      then 
         cash=$(( $cash + 1 )) 
         if [ $cash == $maxLimit ]
         then 
            break
         fi
      else
         cash=$(( $cash - 1 ))
         if [ $cash == $lowLimit ]
         then 
             break
         fi  
      fi
    done
    echo DayCash: $cash
    if [ $cash == $maxLimit ]
    then 
        dayWin=$(($dayWin + 1))
    else
        dayLoss=$(($dayLoss + 1))
    fi
    echo DayWin:$dayWin  DayLoss:$dayLoss 
    totalAmount=$(($totalAmount+$cash))
    echo Day limit Reached
  
 done
 
 echo $totalAmount
}

function totalInvestmentForDays()
{
echo Cash: $stake  Days :$numberDays
totalInvestment=$(($stake*$numberDays))
echo TotalInvestment:$totalInvestment
if [ $totalAmount -lt $totalInvestment ]
then
    lossAmount=$(($totalInvestment-$totalAmount))
    echo Loss:$lossAmount
else
    winAmount=$(($totalAmount-$totalInvestment))
    echo Win:$winAmount
fi
}

limitsOfStakes
bet
totalInvestmentForDays

