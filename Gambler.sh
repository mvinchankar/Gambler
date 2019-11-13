#!/bin/bash -x
echo Welcome Gambler
read -p "How Many Days you want to play" numberDays
totalAmount=0;
cash=100;
maxLimit=0;
lowLimit=0;
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
    totalAmount=$(($totalAmount+$cash))
    echo Day limit Reached
  
 done
 echo $totalAmount
}
limitsOfStakes
bet

