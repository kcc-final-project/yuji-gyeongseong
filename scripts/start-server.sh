#!/bin/bash

echo "--------------- 서버 배포 시작 -----------------"
docker stop yuji-gyeongseong || true
docker rm yuji-gyeongseong || true
docker pull 182399708661.dkr.ecr.ap-northeast-2.amazonaws.com/yuji-gyeongseong:latest
docker run -d --name yuji-gyeongseong -p 8080:8080 182399708661.dkr.ecr.ap-northeast-2.amazonaws.com/yuji-gyeongseong:latest
echo "--------------- 서버 배포 끝 -----------------"