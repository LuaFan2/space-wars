output=$(sh compile.sh 2>&1)
ret=$?

if [[ $output == *'Failed to parse'* ]]; then
	echo "Failed to parse"
	exit 1
fi