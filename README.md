# Docker Hadoop Project

이 프로젝트는 Docker를 사용하여 Hadoop 클러스터를 구축하고 OpenEC를 동작시키는 프레임워크를 자동화하기 위해 수행되었습니다.

---

## 🚀 설치 방법

### **1. Docker 및 Docker Compose 설치**
```bash
sudo apt update && sudo apt upgrade -y
```
```bash
sudo apt install -y docker.io docker-compose
```
```bash
sudo service docker start
```

### **2. Docker Image Pull**
```bash
sudo docker pull jeonjiho/jeon-openec:v6
```

### **3. 원하는 클러스터 수에 맞추어 환경 변수 등 변경**
```bash
./resize-cluster.sh 14
```

### **4. Master-Slave 컨테이너 일괄 실행 (IP 및 포트 개폐 자동 설정)**
```bash
./start-container.sh 14
```

### **5. OpenEC 환경 파일 수정**
```bash
nano /home/openec/openec-v1.0.0/conf/sysSetting.xml
```
- `"local.addr"`을 해당 컨테이너 IP로 변경

### **6. Redis 서버 재부팅**
```bash
sudo rm /var/run/redis_6379.pid
```
```bash
sudo service redis_6379 start
```

### **7. Hadoop File System 초기화**
```bash
hdfs namenode -format
```

### **8. Hadoop File System 실행**
```bash
start-dfs.sh
```

### **9. OpenEC 프레임워크 실행**
```bash
python /home/openec/openec-v1.0.0/script/start.py
```

---

## 🌐 네트워크 구성
- **NameNode**: `192.168.10.21`
- **DataNode**: `192.168.10.22 ~ 192.168.10.34` (총 13개)

---

## 🤝 기여
PR(Pull Request)을 환영합니다. 개조 사항이 있다면 자유롭게 참여해 주세요.

---

## 📝 라이센스
**Apache License**  
Version 2.0, January 2004  
[http://www.apache.org/licenses/](http://www.apache.org/licenses/)

```
Copyright 2025 [JEONJIHO817]
```
This project is licensed under the Apache License 2.0.  
It is based on the work available at:
- [Hadoop Cluster Docker](https://github.com/kiwenlau/hadoop-cluster-docker.git)
- [OpenEC](http://adslab.cse.cuhk.edu.hk/software/openec/)
