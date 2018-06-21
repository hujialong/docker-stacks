#https://docs.docker.com/engine/reference/commandline/build/
if [ -z $CURRENT ]; then
	CURRENT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
fi

docker build --no-cache=true -t hjlhust/datascience:1.0.0 .
docker tag hujl/datascience:1.0.0 hjlhust/datascience:latest


