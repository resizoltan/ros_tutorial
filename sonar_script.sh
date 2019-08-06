# copy wrapper report to local filesystem
docker cp $CONTAINER_NAME:/root/catkin_ws/build-sonar/bw-output /home/travis/build/kroshu/rosintro/bw-output
# run sonar scanner
sonar-scanner
