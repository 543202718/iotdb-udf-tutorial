#!/bin/bash
# 在容器关闭前，优雅的关闭服务并下线服务
 function stop_server() {
	echo "Docker Stop"
    ./zeppelin/bin/zeppelin-daemon.sh stop
	./iotdb/sbin/stop-server.sh
}

echo "Docker Start"
./zeppelin/bin/zeppelin-daemon.sh start
nohup sbin/start-server.sh -b

# 捕捉docker stop时发送的SIGTERM信号
trap 'stop_server' SIGTERM          