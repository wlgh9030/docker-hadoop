# Docker Hadoop Project

이 프로젝트는 Docker를 사용하여 Hadoop 클러스터를 구축하고 OpenEC를 동작시키는 프레임워크를 자동화 하기 위해 수행되었습니다.

## 설치 방법

###1. Docker 및 Docker Compose 설치
'''
sudo apt update && sudo apt upgrade -y
'''
'''
sudo apt install -y docker.io
'''
'''
sudo service docker start
'''
###2. Docker Image Pull
'''
sudo docker pull jeonjiho/jeon-openec:v6
'''
###3. 원하는 클러스터 수에 맞춰 환경 변수 등 변경
'''
./resize-cluster.sh 14
'''
###4. master-slave 노드 일괄 실행(ip 및 포트 개폐 자동 설정)
'''
./start-container.sh 14
'''
###5. OpenEC 환경 파일 수정
''' 
nano /home/openec/openec-v1.0.0/conf/sysSetting.xml
'''
 - "local.addr"을 해당 컨테이너 ip로 변경
###6. redis 서버 재부팅
'''
sudo rm /var/run/redis_6379.pid
'''
'''
sudo service redis_6379 start
'''
###7. 하둡 파일 시스템 초기화
'''
hdfs namenode -format
'''
###8. 하둡 파일 시스템 실행
'''
start-dfs.sh
'''
###9. OpenEC 프레임워크 실행
'''
python /home/openec/openec-v1.0.0/script/start.py
'''

## 네트워크

NameNode: 192.168.10.21
DataNode: 192.168.10.22 ~ 34 (13개)

## 기여

PR(Pull Request)을 환영합니다. 개선 사항이 있다면 자유롭게 참여해 주세요.

## 라이선스

Apache License
Version 2.0, January 2004
http://www.apache.org/licenses/

Copyright 2025 [Your Name]

This project is licensed under the Apache License 2.0.  
It is based on the work available at [https://github.com/kiwenlau/hadoop-cluster-docker.git] & [http://adslab.cse.cuhk.edu.hk/software/openec/].
