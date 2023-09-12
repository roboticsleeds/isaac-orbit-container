PS1="[Isaac Orbit] Singularity> \w \$ "
export ROS_MASTER_URI=http://localhost:11311
export ROS_HOSTNAME=localhost
export TERM=ansi
export ACCEPT_EULA='y'

export ISAACSIM_PATH="$HOME/isaac-sim"
export ISAACSIM_PYTHON_EXE="bash ${ISAACSIM_PATH}/python.sh"
export ORBIT_EXE="bash ${ISAACSIM_PATH}/orbit/orbit.sh"
alias orbit="$ORBIT_EXE"
alias python="orbit -p"
