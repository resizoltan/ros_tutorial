# save current working directory
working_dir=$PWD
# create directory for sonar related software
mkdir /root/sonar
cd /root/sonar
# install build wrapper for sonarqube c++
wget https://sonarcloud.io/static/cpp/build-wrapper-linux-x86.zip
unzip build-wrapper-linux-x86.zip
chmod +x build-wrapper-linux-x86/build-wrapper-linux-x86-64
# install sonar-scanner
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip
unzip sonar-scanner-cli-4.0.0.1744-linux.zip
# return to working directory
cd $working_dir
