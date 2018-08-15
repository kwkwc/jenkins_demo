#!/bin/bash

# Program:
#     deploy jenkins
# Version:
#     1.0.0
# History:
#     Created on 2018/08/15
#     Last modified on 2018/08/15

# 容器名称
CONTAINER="jenkins_demo"
# 镜像名称（以日期时间为镜像标签，防止重复）
IMAGE=$CONTAINER":"$(date -d "today" +"%Y%m%d_%H%M%S")

# 创建新镜像
docker build -t $IMAGE . && \

# 删除 docker-compose.jenkins.yml 文件，防止使用相同镜像
rm -rf docker-compose.jenkins.yml && \

# 复制 docker-compose.src.yml 文件，防止污染原文件
cp docker-compose.src.yml docker-compose.jenkins.yml && \

# 替换镜像名标志位为最新镜像
sed -i s%IMAGE_LATEST%$IMAGE%g docker-compose.jenkins.yml && \

# 使用 docker stack 启动服务
docker stack deploy -c docker-compose.jenkins.yml $CONTAINER
