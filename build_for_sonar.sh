current_dir=$PWD
#output_dir_local="bw-output"
#output_dir_global="$PWD/$output_dir_local"
echo $PATH
cd /root/catkin_ws
rm -rf build
mkdir build
cd build
cmake ../src/rosintro
ls /home/travis/.sonar/cache/681277d525b6e4c5ed5e6c2a429caa64/build-wrapper-linux-x86/
/home/travis/.sonar/cache/681277d525b6e4c5ed5e6c2a429caa64/build-wrapper-linux-x86/build-wrapper-linux-x86-64 --out-dir "/root/catkin_ws/bw-output" make
cd /root/catkin_ws/src/rosintro
ls /home/travis/.sonarscanner/sonar-scanner-3.0.3.778/bin
/home/travis/.sonarscanner/sonar-scanner-3.0.3.778/bin/sonar-scanner
cd $current_dir
#cd /home/travis/build/kroshu/rosintro
