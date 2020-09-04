#!/bin/bash
# Author : https://github.com/ultreson
# Creation Date : 2019-06-18
# Source : probably https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories answer from https://stackoverflow.com/users/5349856/liudvikas
# Tested on : Git for Windows v2.28.0 with bash 4.4.23
#             Raspberry Pi OS with bash 5.0.3
#             Ubuntu 20.04.1 LTS on Windows 10 x86_64 with bash 5.0.17
#             Ubuntu 20.04.1 LTS x86_64 with bash 5.0.17

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