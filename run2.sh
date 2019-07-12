

CNT=3000000

for thds in 1 8 16 32 64 128 
do
	printf "  thread[%d] start : %s\n" $thds "`date`"
	sysbench.sh $thds 0      10 oltp_insert        cleanup > /dev/null
	sysbench.sh $thds 0      10 oltp_insert        prepare > /dev/null
	printf "i)thread[%d] start : %s\n" $thds "`date`"
	sysbench.sh $thds 100000 10 oltp_insert        run     > log/i/sysbench.$thds.log 
	printf "u)thread[%d] start : %s\n" $thds "`date`"
	sysbench.sh $thds 100000 10 oltp_update_index  run     > log/u/sysbench.$thds.log
	printf "s)thread[%d] start : %s\n" $thds "`date`"
	sysbench.sh $thds 100000 10 oltp_read_only     run     > log/s/sysbench.$thds.log
	printf "d)thread[%d] start : %s\n" $thds "`date`"
	sysbench.sh $thds 100000 10 oltp_delete        run     > log/d/sysbench.$thds.log

done
