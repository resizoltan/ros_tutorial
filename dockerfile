FROM openjdk:8-slim

RUN apk add --no-cache  curl grep sed unzip nodejs nodejs-npm

WORKDIR /usr/src

RUN curl --insecure -o ./sonarscanner.zip -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip && \
	unzip -q sonarscanner.zip && \
	rm sonarscanner.zip && \
	mv sonar-scanner-3.0.3.778-linux /usr/lib/sonar-scanner && \
  ln -s /usr/lib/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner

#   ensure Sonar uses the provided Java for musl instead of a borked glibc one
RUN sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /usr/lib/sonar-scanner/bin/sonar-scanner

ENV ROS_DISTRO $ROS_DISTRO

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update -qq \
    && apt-get -qq install --no-install-recommends -y apt-utils gnupg wget ca-certificates lsb-release dirmngr

RUN echo "deb ${ROS_REPOSITORY_PATH} \$(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list
RUN for i in 1 2 3; do { apt-key adv --keyserver '${APTKEY_STORE_SKS}' --recv-key '${HASHKEY_SKS}'; } &&  break || sleep 1; done

RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list \
    && apt-get update -qq \
    && apt-get -qq install --no-install-recommends -y \
        build-essential \
        python-catkin-tools \
        python-pip \
        python-rosdep \
        python-wstool \
        ros-$ROS_DISTRO-catkin \
        ssh-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

# Separating ENTRYPOINT and CMD operations allows for core execution variables to
# be easily overridden by passing them in as part of the `docker run` command.
# This allows the default /usr/src base dir to be overridden by users as-needed.
#ENTRYPOINT ["sonar-scanner"] 
#CMD ["-Dsonar.projectBaseDir=/usr/src"]
