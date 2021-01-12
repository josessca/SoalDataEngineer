sed '/^[[:space:]]*$/d' makan.txt | cut -d' ' -f2 | sort | uniq
