#!/bin/bash

# the default node number is 3
N=${1:-3}

# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
sudo docker run --restart="always" \
                --ip 192.168.10.21 \
                -itd \
                --net=hadoop-net \
                -v hadoop-master:/vol \
                -p 50070:50070 \
                -p 6379:6379 \
                -p 5001:5001 \
                -p 8088:8088 \
                -p 22:22\
                --name hadoop-master \
                --hostname hadoop-master \
                jeonjiho/jeon-openec:v6 &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	sudo docker run --restart="always" \
                        --ip 192.168.10.$(( $i + 21 )) \
                        -v hadoop-slave$i:/vol \
                        -itd \
	                --net=hadoop-net \
                        -p $((22+i)):22\
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                jeonjiho/jeon-openec:v6 &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sudo docker exec -it hadoop-master bash
