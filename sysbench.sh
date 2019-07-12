


if [ "$#" -ne 5 ]; 
then
    echo  "Usage : sysbench.sh <thread_cnt> <row_cnt> <table_cnt> <lua_name> <op_type(prepare,run,cleanup)>"
    exit 255
fi


HOST=$MYSQL_HOST
PORT=3306
USER=test
PASS=test
DB=test
WARM_SEC=5
THREAD_CNT=$1
ROW_CNT=$2
TABLE_CNT=$3
LUA_NAME=$4
OP_TYPE=$5
RUN_TIME=120
LUA_PATH=/home/cloud_softwiz/workspace/sysbench/share/sysbench


CMD="
sysbench \
--time=$RUN_TIME \
--percentile=99 \
--histogram \
--mysql-host=$HOST  \
--mysql-port=$PORT  \
--mysql-user=$USER  \
--mysql-password=$PASS  \
--mysql-db=$DB \
--warmup-time=$WARM_SEC \
--threads=$THREAD_CNT \
--table-size=$ROW_CNT \
--tables=$TABLE_CNT \
$LUA_PATH/$LUA_NAME.lua \
$OP_TYPE"

echo -e $CMD

$CMD
