#! /bin/bash

declare -A tossesCount
for i in {1..20}
do
	flip=$(( RANDOM%2 ))

	if [ $flip -eq 0 ]
	then
		(( tossesCount["HEAD"]++ ))
	else
		(( tossesCount["TAIL"]++ ))
	fi
done

echo "Head Percentage : " `echo ${tossesCount["HEAD"]} | awk '{print$1/20*100}'`
echo "Head Percentage : " `echo ${tossesCount["TAIL"]} | awk '{print$1/20*100}'`

