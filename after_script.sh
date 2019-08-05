# save current working directory
working_dir=$PWD
# create build space for sonar
cd /root/catkin_ws
mkdir build_sonar
cd build_sonar
# make using sonar build wrapper
cmake ../src/rosintro
/root/sonar/build-wrapper-linux-x86/build-wrapper-linux-x86-64 --out-dir "/home/travis/build/kroshu/rosintro/bw-output" make
# make tests
make test
# execute sonar-scanner
cd /home/travis/build/kroshu/rosintro
/root/sonar/sonar-scanner-4.0.0.1744-linux/bin/sonar-scanner
# return to working directory
cd $working_dir
