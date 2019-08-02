current_dir=$PWD
output_dir_local="bw-output"
output_dir_global="$PWD/$output_dir_local"
cd /root/catkin_ws
rm -rf build
mkdir build
cd build
cmake ../src/beginner_tutorials
build-wrapper-linux-x86-64 --out-dir $output_dir_global make
cd /home/travis/build/kroshu/rosintro
