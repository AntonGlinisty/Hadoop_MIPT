OUT_DIR1="reducers_output1"
OUT_DIR2="reducers_output2"
NUM_REDUCERS1=8
NUM_REDUCERS2=1

hdfs dfs -rm -r -skipTrash ${OUT_DIR1}* > /dev/null
hdfs dfs -rm -r -skipTrash ${OUT_DIR2}* > /dev/null

yarn jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -D mapreduce.job.name="Streaming bigrams" \
    -D mapreduce.job.reduces=${NUM_REDUCERS1} \
    -files mapper1.py,reducer1.py \
    -mapper mapper1.py \
    -reducer reducer1.py \
    -input /data/wiki/en_articles \
    -output ${OUT_DIR1} > /dev/null

yarn jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -D mapreduce.job.name="Streaming bigrams sort" \
    -D mapreduce.job.reduces=${NUM_REDUCERS2}  \
    -D mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapreduce.lib.partition.KeyFieldBasedComparator \
    -D mapreduce.partition.keycomparator.options=-nr \
    -files mapper2.py,reducer2.py \
    -mapper mapper2.py \
	-reducer reducer2.py \
    -input ${OUT_DIR1} \
    -output ${OUT_DIR2} > /dev/null

hdfs dfs -cat ${OUT_DIR2}/part-00000 | head -n10
