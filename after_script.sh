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

# run sonar scanner
#mkdir /root/sonar/src
#cp -r /root/catkin_ws/src/rosintro /root/sonar/src/
cd /root/catkin_ws/src/rosintro
whoami
lsattr
ls -la
chmod 777 /root/catkin_ws/src/rosintro
lsattr
ls -la
fdisk -l
cat /etc/fstab
/root/sonar/sonar-scanner-4.0.0.1744-linux/bin/sonar-scanner
# return to working directory
cd $working_dir

