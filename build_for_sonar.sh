current_dir=$PWD
output_dir_local="bw-output"
output_dir_global="$PWD/$output_dir_local"
pushd /root/catkin_ws
catkin clean --build --yes
mkdir build
cd build
cmake ../src/beginner_tutorials
build-wrapper-linux-x86-64 --out-dir $output_dir_global make
popd
