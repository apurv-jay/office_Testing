#! /bin/zsh

#Basic script to check all files and folders for some specific keyword in files and put the found resutls in a different directory
cnt=1
search() {
    local phrase=$1
    local src=$2

    
    for file in $src/*
    do 
        if [ -d "$file" ]
        then 
            search "$phrase" "$file"
            continue
        fi
        grep -ni "$phrase" $file
        local grep_res=$?
        if [[ $grep_res -eq 0 ]]
        then
            cp $file /Users/apoorvs/result_dir/$cnt.txt
            local res=$(grep -ni "$phrase" $file)
            echo "\n$res" >> /Users/apoorvs/result_dir/$cnt.txt
            cnt=$(($cnt+1))
        fi


    done

}

echo "Enter the phrase you want to search for: "
read phrase

echo "Enter the directory where you want to search: "
read src 

search "$phrase" "$src"