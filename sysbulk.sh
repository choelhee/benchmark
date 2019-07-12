
if [ "$#" -ne 2 ]; 
then
    echo  "Usage : sysbulk.sh <thread_cnt> <op_type(prepare,run,cleanup)>"
    exit 255
fi


HOST=$MYSQL_HOME
PORT=3306
USER=test
PASS=test
DB=test
WARM_SEC=10
THREAD_CNT=$1
OP_TYPE=$2


CMD="
sysbench \
bulk_insert \
--time=120 \
--percentile=99 \
--histogram \
--mysql-host=$HOST  \
--mysql-port=$PORT  \
--mysql-user=$USER  \
--mysql-password=$PASS  \
--mysql-db=$DB \
--warmup-time=$WARM_SEC \
--threads=$THREAD_CNT \
bulk_insert
$OP_TYPE"

echo -e $CMD

sysbench \
bulk_insert \
--time=120 \
--percentile=99 \
--histogram \
--mysql-host=$HOST  \
--mysql-port=$PORT  \
--mysql-user=$USER  \
--mysql-password=$PASS  \
--mysql-db=$DB \
--warmup-time=$WARM_SEC \
--threads=$THREAD_CNT \
$OP_TYPE
