#!/bin/bash
CVC4_BIN=~/cvc4-1.7-x86_64-linux-opt
#for_cvc4=./for_cvc4


test_file () {
	filename=`echo $1 | cut -d'/' -f 2`
	echo "$filename"
	base_filename="${filename%.*}"
	STARTTIME=$(date +%s)
	out=`timeout 20 $CVC4_BIN $1`
	retval=$?
	if [ $retval = 0 ]; then
		echo "$out"
	fi
	for cvc4_file in $for_cvc4/$base_filename*.sl; do
		out=`timeout 20 $CVC4_BIN $cvc4_file`
		retval=$?
		if [ $retval = 0 ]; then
			echo "$out"
		fi
	done
	ENDTIME=$(date +%s)
	echo "$(($ENDTIME - $STARTTIME))s"
	echo ----
}
for f in contradiction/*.sl; do
  test_file $f
done
for f in returns_garbage/*.sl; do
  test_file $f
done
