current_dir=$PWD
#output_dir_local="bw-output"
#output_dir_global="$PWD/$output_dir_local"
cd /root/catkin_ws
rm -rf build
mkdir build
cd build
cmake ../src/beginner_tutorials
build-wrapper-linux-x86-64 --out-dir "/root/catkin_ws/bw-output" make
cd /root/catkin_ws/src/beginner_tutorials
sonar-scanner
cd $current_dir
#cd /home/travis/build/kroshu/rosintro
