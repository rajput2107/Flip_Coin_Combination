#! /bin/bash

declare -A tossesCount
for i in {1..20}
do
	flip1=$(( RANDOM%2 ))
	flip2=$(( RANDOM%2 ))
	flip3=$(( RANDOM%2 ))

	if [ $flip1 -eq 0 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 0 ]
	then
		(( tossesCount["HHH"]++ ))

	elif [ $flip1 -eq 0 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 1 ]
	then
		(( tossesCount["HHT"]++ ))

	elif [ $flip1 -eq 0 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 1 ]
	then
		(( tossesCount["HTT"]++ ))
	elif [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 1 ]
	then
		(( tossesCount["TTT"]++ ))
	elif [ $flip1 -eq 1 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 0 ]
        then
                (( tossesCount["THH"]++ ))

        elif [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 0 ]
        then
                (( tossesCount["TTH"]++ ))

        elif [ $flip1 -eq 1 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 1 ]
        then
                (( tossesCount["THT"]++ ))
        elif [ $flip1 -eq 0 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 0 ]
        then
                (( tossesCount["HTH"]++ ))

	fi
done

echo "HHH Percentage : " `echo ${tossesCount["HHH"]} | awk '{print$1/20*100}'`
echo "HHT Percentage : " `echo ${tossesCount["HHT"]} | awk '{print$1/20*100}'`
echo "HTT Percentage : " `echo ${tossesCount["HTT"]} | awk '{print$1/20*100}'`
echo "TTT Percentage : " `echo ${tossesCount["TTT"]} | awk '{print$1/20*100}'`
echo "TTH Percentage : " `echo ${tossesCount["TTH"]} | awk '{print$1/20*100}'`
echo "THH Percentage : " `echo ${tossesCount["THH"]} | awk '{print$1/20*100}'`
echo "HTH Percentage : " `echo ${tossesCount["HTH"]} | awk '{print$1/20*100}'`
echo "THT Percentage : " `echo ${tossesCount["THT"]} | awk '{print$1/20*100}'`
