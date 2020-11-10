DEFAULT_DOCKER_IMAGE="docker"
DEFAULT_CONTAINER_NAME="docker_container"

WORK_DIR=`pwd`
CONTAINER_WORK_DIR=$WORK_DIR

CONTAINER_NAME=$DEFAULT_CONTAINER_NAME
DOCKER_IMAGE=$DEFAULT_DOCKER_IMAGE

# Executando o docker
docker run  -it \
            --env="DISPLAY=:0" \
            --env="QT_X11_NO_MITSHM=1" \
            --name=$CONTAINER_NAME \
            --volume="/dev:/dev" \
            --net=host \
            --privileged \
            --workdir="${CONTAINER_WORK_DIR}" \
            --volume="${WORK_DIR}:${CONTAINER_WORK_DIR}" \
            -v $HOME/.Xauthority:/root/.Xauthority \
            $DOCKER_IMAGE

docker container rm $CONTAINER_NAME -f
