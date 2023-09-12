-c /bin/bash

apt-get update 
DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
DEBIAN_FRONTEND=noninteractive TZ="Europe/London" apt-get install -y tzdata
apt-get -y upgrade

apt-get install -y --force-yes \
    wget \
    ffmpeg \
    vim-gtk \
    zip \
    unzip \
    git \
    build-essential \
    software-properties-common \
    xterm \
    pypy \
    cmake \
    curl \
    python \
    psmisc \
    apt-utils \
    python3-pip \
    mesa-utils \
    software-properties-common

# Installation of ROS Noetic and essential packages
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
apt update
apt install -y --force-yes \
    ros-noetic-desktop \
    ros-noetic-rosbash \
    python3-rosdep \
    python3-wstool \
    python3-catkin-tools

# Init rosdep and update
rosdep init
rosdep update

# Install VS Code
cd /tmp
curl -o code.deb -L http://go.microsoft.com/fwlink/?LinkID=760868
apt-get install -y ./code.deb

# Let's have a custom PS1 to help people realise in which container they are
# working.
CUSTOM_ENV=/.singularity.d/env/99-zz_custom_env.sh
cat >$CUSTOM_ENV <<EOF
#!/bin/bash
PS1="[Isaac Orbit] Singularity> \w \$ "
EOF
chmod 755 $CUSTOM_ENV

