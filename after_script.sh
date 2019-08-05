# save current working directory
working_dir=$PWD
# create build space for sonar
cd /root/catkin_ws
mkdir build_sonar
cd build_sonar
# make using sonar build wrapper
cmake ../src/rosintro
/root/sonar/build-wrapper-linux-x86/build-wrapper-linux-x86-64 --out-dir "/root/catkin_ws/build_sonar/bw-output" make
# make tests
make test
# copy wrapper report to local filesystem
# shellcheck source=industrial_ci/src/util.sh
source "${ICI_SRC_PATH}/util.sh"
# shellcheck source=industrial_ci/src/docker.sh
source "${ICI_SRC_PATH}/docker.sh"
# shellcheck source=industrial_ci/src/env.sh
source "${ICI_SRC_PATH}/env.sh"
docker_cp CONTAINER:/root/catkin_ws/build-sonar/bw-output /home/travis/build/rosintro/bw-output
# return to working directory
cd $working_dir

