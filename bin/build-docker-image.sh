#!/usr/bin/env bash

### 一键构建 docker 镜像。默认在项目根目录运行该脚本。

mvn clean package -U & cd webapp/ && npm install && npm run build && cd ..

docker-compose up -d
