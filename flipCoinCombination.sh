#! /bin/bash

declare -A tossesCount
for i in {1..20}
do
	flip1=$(( RANDOM%2 ))
	flip2=$(( RANDOM%2 ))

	if [ $flip1 -eq 0 ] && [ $flip2 -eq 0 ]
	then
		(( tossesCount["HH"]++ ))

	elif [ $flip1 -eq 0 ] && [ $flip2 -eq 1 ]
	then
		(( tossesCount["HT"]++ ))

	elif [ $flip1 -eq 1 ] && [ $flip2 -eq 0 ]
	then
		(( tossesCount["TH"]++ ))
	else
		(( tossesCount["TT"]++ ))
	fi
done

echo "HH Percentage : " `echo ${tossesCount["HH"]} | awk '{print$1/20*100}'`
echo "TT Percentage : " `echo ${tossesCount["TT"]} | awk '{print$1/20*100}'`
echo "HT Percentage : " `echo ${tossesCount["HT"]} | awk '{print$1/20*100}'`
echo "TH Percentage : " `echo ${tossesCount["TH"]} | awk '{print$1/20*100}'`

