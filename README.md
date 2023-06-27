# IsaacSim Singularity Container with ROS Noetic

This is a singularity container for the Nvidia Isaac Sim. It builds
on top of Nvidia's official image, but also installs ROS Noetic.

*"Isaac Sim" is a registered trademark of Nvidia. We would like to clarify 
that we have no affiliation, partnership, or endorsement with Nvidia or the Isaac 
Sim platform. Any references made to "Isaac Sim" are purely for 
informational purposes and do not imply any official association with Nvidia.*

**Author:** Rafael Papallas ([rpapallas.com](https://rpapallas.com))

## Create API key

Building this container will require authentication with NGC.

First, make sure Singularity is installed on your computer. Follow the "Quick
Installation Steps" guide [here](https://docs.sylabs.io/guides/3.11/user-guide/quick_start.html).

Here are the steps:

1. First create an NGC account here: [https://ngc.nvidia.com/](https://ngc.nvidia.com/).
2. Once you do, head to [https://ngc.nvidia.com/setup/api-key](https://ngc.nvidia.com/setup/api-key)
and generate an API key.
3. Set the following environment variables:

```bash
export SINGULARITY_DOCKER_USERNAME="\$oauthtoken" 
export SINGULARITY_DOCKER_PASSWORD="[YOUR API TOKEN FROM ABOVE]"
```

It's important that the `SINGULARITY_DOCKER_USERNAME` is set exactly like
above, including the `\$`. For the password, of course replace the `[YOUR API TOKEN FROM ABOVE]` 
to the actual API token generated above.

## Build the container and run the simulator

1. Then run the build script: `./build.sh`.
1. You can then run the container: `./run.sh`.
1. You need to "accept EULA" to run the simulator. It's available [here](https://docs.omniverse.nvidia.com/app_isaacsim/common/NVIDIA_Omniverse_License_Agreement.html). 
   To do this, in the container's home directory, open the `.bashrc` file
   (note, not your host OS's `.bashrc` but the `.bashrc` of the container which is
   under `isaac-sim-container/home/.bashrc`) and put the following: `export ACCEPT_EULA="Y"`. 
   This is the way of "ticking" the "I accept EULA" for the license linked above.
1. To launch Isaac Sim you need to head to `cd /isaac-sim` (note to the root dir `/`) 
   and run `./runapp.sh` within the container. Allow some time to download dependencies.


## Other notes

* Make sure that nvidia drivers and CUDA are installed on your host machine;
verify by running `nvidia-smi`.
* The `run.sh` script will bind the drivers if available; double check they
are available in the container by running `nvidia-smi` within the container 
as well.
