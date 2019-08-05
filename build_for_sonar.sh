current_dir=$PWD
#output_dir_local="bw-output"
#output_dir_global="$PWD/$output_dir_local"
echo $PATH
cd /root/catkin_ws
rm -rf build
mkdir build
cd build
cmake ../src/rosintro
build-wrapper-linux-x86-64 --out-dir "/root/catkin_ws/bw-output" make
cd /root/catkin_ws/src/rosintro
sonar-scanner
cd $current_dir
#cd /home/travis/build/kroshu/rosintro
