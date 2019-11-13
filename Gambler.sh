#!/bin/bash -x
echo Welcome Gambler
read -p "How Many Days you want to play" numberDays
function bet()
{

for(( j=1; j<=numberDays; j++ ))
do 
  echo Day$numberDays
  #read -p "How many times you want to play :" playTimes
  cash=100;
  while [ $cash != 0 ] 
  do 
    bet=$((RANDOM%2))
    if [ $bet == 1 ]
    then 
        cash=$(( $cash + 1 )) 
        echo You Win $cash
        if [ $cash == 150 ]
        then 
            break
        fi
    else
        cash=$(( $cash - 1 ))
        echo You Lose $cash
        if [ $cash == 50 ]
        then 
            break
        fi  
    fi
  done
echo Day limit Reached
done
}
bet
