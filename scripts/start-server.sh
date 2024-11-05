#!/bin/bash

echo "--------------- 서버 배포 시작 -----------------"
docker stop yuji || true
docker rm yuji || true
docker pull 398084668438.dkr.ecr.ap-northeast-2.amazonaws.com/yuji:latest
docker run -d --name yuji -p 8080:8080 398084668438.dkr.ecr.ap-northeast-2.amazonaws.com/yuji:latest
echo "--------------- 서버 배포 끝 -----------------"