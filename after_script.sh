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
docker_cp CONTAINER:/root/catkin_ws/build-sonar/bw-output /home/travis/build/rosintro/bw-output
# return to working directory
cd $working_dir

