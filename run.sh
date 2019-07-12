

CNT=3000000

for threads in 1 8 16 32 64 128 
do
	sysbench.sh $threads $CNT 10 prepare >  log/sysbench.$threads.log
	sysbench.sh $threads $CNT 10 run     >> log/sysbench.$threads.log
	sysbench.sh $threads $CNT 10 cleanup >> log/sysbench.$threads.log

done
