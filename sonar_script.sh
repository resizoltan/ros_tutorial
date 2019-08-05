# shellcheck source=industrial_ci/src/util.sh
source "${ICI_SRC_PATH}/util.sh"
# shellcheck source=industrial_ci/src/docker.sh
source "${ICI_SRC_PATH}/docker.sh"
# shellcheck source=industrial_ci/src/env.sh
source "${ICI_SRC_PATH}/env.sh"
# copy wrapper report to local filesystem
docker_cp $cid:/root/catkin_ws/build-sonar/bw-output /home/travis/build/rosintro/bw-output
