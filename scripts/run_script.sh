#!/bin/bash
source /opt/ros/noetic/setup.bash

if [ ! -d "$HOME/catkin_ws/devel" ]; then
    mkdir -p $HOME/catkin_ws/src
    cd $HOME/catkin_ws/src
    catkin_init_workspace
    cd $HOME/catkin_ws
    catkin_make
fi

source $HOME/catkin_ws/devel/setup.bash
source $HOME/.bashrc

