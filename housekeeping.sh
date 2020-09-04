#!/bin/bash
#find . -name ".git" -type d | sed 's/\/.git//' | xargs -P10 -I{} git -C {} status
for dir in $(find . -name ".git")
do cd ${dir%/*}
    echo -e '\033[1;33m'$PWD '\033[0;37m'
    git gc
    echo ""
    cd - > /dev/null
done
echo press any key to continue
read