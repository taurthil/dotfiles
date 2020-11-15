#!/bin/bash
#TASK ARRAY
TASKS=($(hamster list | awk '{for(i=1;i<=NF;i++){ if(match($i,/[A-Z]-[0-9]/)){print $i} } }' ))
#Convert array to list
function gen_list()
{
for s in "${TASKS[@]}"; do 
    echo "$s"
done
}

TASK_ID=$( gen_list | rofi -dmenu -p "TASK" )
OLD_TASK=$(cat /tmp/dotask-id)
#Task TEMP
echo $TASK_ID > /tmp/dotask-id

if [ ! -z "$TASK_ID" ];
then
      hamster stop $OLD_TASK
      hamster start $TASK_ID
fi
