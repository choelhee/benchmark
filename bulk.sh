

CNT=3000000

for threads in 1 8 16 32 64 128
do
    sysbulk.sh $threads         prepare >  log/sysbulk.$threads.log
    sysbulk.sh $threads         run     >> log/sysbulk.$threads.log
    sysbulk.sh $threads         cleanup >> log/sysbulk.$threads.log

done
