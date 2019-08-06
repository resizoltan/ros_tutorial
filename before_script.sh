# install unzip
apt-get install unzip
# apt-get install default-jre -y
# save current working directory
working_dir=$PWD
# create directory for sonar related software
mkdir /root/sonar
cd /root/sonar
# install build wrapper for sonarqube c++
wget https://sonarcloud.io/static/cpp/build-wrapper-linux-x86.zip
unzip -q build-wrapper-linux-x86.zip
chmod +x build-wrapper-linux-x86/build-wrapper-linux-x86-64
# install sonar-scanner
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip
unzip -q sonar-scanner-cli-4.0.0.1744-linux.zip
sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /root/sonar/sonar-scanner-4.0.0.1744-linux/bin/sonar-scanner
chown -R root /root/sonar/sonar-scanner-4.0.0.1744-linux/bin/sonar-scanner
# return to working directory
cd $working_dir
