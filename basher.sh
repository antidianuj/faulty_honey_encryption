#!/usr/bin/expect

declare -a string_list=("hello" "hi" "bbc", "abc","again", "age", "agent", "agree", "ahead", "aim", "air", "airport", "aisle", "alarm", "album", "alcohol", "alert", "alien", "all", "alley", "allow", "almost", "alone")
declare -i i=0

for password in "${string_list[@]}"; do
    # expect -c 'spawn python3 encrypt.py -d -c ciphertext.txt -o plaintexter_${i}.txt; expect "Password:"; send "hello\n"; interact'
    env i=$i expect -c "spawn python3 encrypt.py -d -c ciphertext.txt -o plaintexter_\${env(i)}.txt; expect \"Password:\"; send \"${password}\n\"; interact"
    i=$((i+1))
done
