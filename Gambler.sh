#!/bin/bash -x
echo Welcome Gambler
read -p "How Many Days you want to play" numberDays
function bet()
{

for(( j=1; j<=numberDays; j++ ))
do 
  #read -p "How many times you want to play :" playTimes
  cash=100;
  while [ $cash != 0 ] 
  do 
    
    cash=$(( $cash - 1 )) 
    echo $cash
  done
done
}
bet
