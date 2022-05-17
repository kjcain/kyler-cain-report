NAME=kjcain/kyler-cain-report
TAG=`date +%Y-%m-%d_%H-%M-%S`

BUILD=../.build

docker build -f Dockerfile -t "${NAME}:${TAG}" -t "${NAME}:latest" .
docker push "${NAME}" -a
