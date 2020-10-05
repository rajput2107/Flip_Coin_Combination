#! /bin/bash
# //flip coin
declare -A tossesCount3
declare -A tossesCount2
declare -A tossesCount

function triplet() {
	flip1=$1
	flip2=$2
	flip3=$3


	if [ $flip1 -eq 0 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 0 ]
	then
		(( tossesCount3["HHH"]++ ))

	elif [ $flip1 -eq 0 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 1 ]
	then
		(( tossesCount3["HHT"]++ ))

	elif [ $flip1 -eq 0 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 1 ]
	then
		(( tossesCount3["HTT"]++ ))
	elif [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 1 ]
	then
		(( tossesCount3["TTT"]++ ))
	elif [ $flip1 -eq 1 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 0 ]
        then
                (( tossesCount3["THH"]++ ))

        elif [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 0 ]
        then
                (( tossesCount3["TTH"]++ ))

        elif [ $flip1 -eq 1 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 1 ]
        then
                (( tossesCount3["THT"]++ ))
        elif [ $flip1 -eq 0 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 0 ]
        then
                (( tossesCount3["HTH"]++ ))

	fi

}



function doublet() {

	dflip1=$1
	dflip2=$2

	if [ $dflip1 -eq 0 ] && [ $dflip2 -eq 0 ]
	then
		(( tossesCount2["HH"]++ ))

	elif [ $dflip1 -eq 0 ] && [ $dflip2 -eq 1 ]
	then
		(( tossesCount2["HT"]++ ))

	elif [ $dflip1 -eq 1 ] && [ $dflip2 -eq 0 ]
	then
		(( tossesCount2["TH"]++ ))
	else
		(( tossesCount2["TT"]++ ))
	fi
}


function singlet() {
	flip=$1

	if [ $flip -eq 0 ]
	then
		(( tossesCount["HEAD"]++ ))
	else
		(( tossesCount["TAIL"]++ ))
	fi
}



function maxIndex() {

	#Triplet
	max=-1
	for key in ${!tossesCount3[@]}
	do
		value=${tossesCount3[$key]}
		if [ $value -gt $max ]
		then
			max=$value
			Key=$key
		fi
	done
	echo ""
	echo "Triplet Winner: "$Key $max

	#Doublet
	max=-1
        for key in ${!tossesCount2[@]}
        do
                value=${tossesCount2[$key]}
                if [ $value -gt $max ]
                then
                        max=$value
                        Key=$key
                fi
        done
	echo ""
        echo "Doublet Winner: "$Key $max

	#Singlet
	max=-1
        for key in ${!tossesCount[@]}
        do
                value=${tossesCount[$key]}
                if [ $value -gt $max ]
                then
                        max=$value
                        Key=$key
                fi
        done
        echo ""
        echo "Singlet Winner: "$Key $max

}


for i in {1..20}
do
	toss1=$(( RANDOM%2 ))
	toss2=$(( RANDOM%2 ))
	toss3=$(( RANDOM%2 ))

	triplet $toss1 $toss2 $toss3
	doublet $toss1 $toss2
	singlet $toss1
done






echo "HHH Percentage : " `echo ${tossesCount3["HHH"]} | awk '{print$1/20*100}'`
echo "HHT Percentage : " `echo ${tossesCount3["HHT"]} | awk '{print$1/20*100}'`
echo "HTT Percentage : " `echo ${tossesCount3["HTT"]} | awk '{print$1/20*100}'`
echo "TTT Percentage : " `echo ${tossesCount3["TTT"]} | awk '{print$1/20*100}'`
echo "TTH Percentage : " `echo ${tossesCount3["TTH"]} | awk '{print$1/20*100}'`
echo "THH Percentage : " `echo ${tossesCount3["THH"]} | awk '{print$1/20*100}'`
echo "HTH Percentage : " `echo ${tossesCount3["HTH"]} | awk '{print$1/20*100}'`
echo "THT Percentage : " `echo ${tossesCount3["THT"]} | awk '{print$1/20*100}'`

echo ""

echo "HH Percentage : " `echo ${tossesCount2["HH"]} | awk '{print$1/20*100}'`
echo "TT Percentage : " `echo ${tossesCount2["TT"]} | awk '{print$1/20*100}'`
echo "HT Percentage : " `echo ${tossesCount2["HT"]} | awk '{print$1/20*100}'`
echo "TH Percentage : " `echo ${tossesCount2["TH"]} | awk '{print$1/20*100}'`

echo ""

echo "Head Percentage : " `echo ${tossesCount["HEAD"]} | awk '{print$1/20*100}'`
echo "Head Percentage : " `echo ${tossesCount["TAIL"]} | awk '{print$1/20*100}'`


echo ""
echo ""
echo "WINNER"

IFS=$'\n' sorted=($(sort -g <<<"${tossesCount[*]}"))
unset IFS
echo "Singlet : "${sorted[@]}

IFS=$'\n' sorted2=($(sort -g <<<"${tossesCount2[*]}"))
unset IFS
echo "Doublet : "${sorted2[@]}

IFS=$'\n' sorted3=($(sort -g <<<"${tossesCount3[*]}"))
unset IFS
echo "Triplet : "${sorted3[@]}

maxIndex
