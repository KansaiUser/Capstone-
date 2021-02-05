# Developing Udacity Self-driving Enginner Nanodegree program final project


## The process

First, I wanted to develop this project using Docker. I did not want to install ROS on my machine, or use a virtual machine as suggested. Instead I prefered to use a docker container. 

My first problem was that I was not aware of a good docker image for this. First I tried to use a minimal ROS docker image that I have developed (both for noetic and kinetic). But my images lack of many ROS features.

Then I discovered the capstone image mentioned in the readme. My first attempt was to do it on docker on a windows machine. 

I build the image and then changing a bit of the command I could run the docker container. The problem was when executing the `catkin_make` command. It fails. First because the `CMakeLists.txt` is a linux link one, which in windows is treated as a simple text file. This produces that catkin_make fails.

So I switched over to my Ubuntu 20.04.1 LTS machine.
First I tried to build the docker container. It failed. 
I noticed also that it is using Python 2.7
The image building failed in the numpy installation. 

I tried changing the base to noetic and changing pip to pip3 where applicable but the image could not be built by imcompatibility of the versions of keras and TF.

I went back to the original docker file, and modified it to install everything by hand. 
Then I discovered that the requirements file *did not need to include numpy* since it was already installed. So I erased numpy from requirements and build the image 






## Problems when running the simulator

When trying to run the simulator by using the file `unity_simulator_launcher.sh`
I got two problems: 

* The first one is that for some reason I can not select the file sys_int.x86. The program does not recognize it as a file

* The second is that for the file sys_init.x86_64, it recognizes it as a file but then  I got the error

Got a SIGABRT while executing native code. This usually indicates
a fatal error in the mono runtime or one of the native libraries 
used by your application.

I suspect this is because of users and permissions

cat /etc/passwd|grep 1000
 shows no user 1000

 https://medium.com/redbubble/running-a-docker-container-as-a-non-root-user-7d2e00f8ee15


 Note: I think I have been able to run the simulator by double-clicking the file, (previously made executable)

 Updates on January 23

 I have been able to run the simulator graphically.
 However when running the launch file styx.lauch an error occurs.
 However even the error happens the other nodes still run and the waypoint updater still publishes. 
 And in the simulator I can see the waypoints.

 Next I am going to modify the launcher so as not to include the simulator that is already running anyway

 I have modified the launcher so as not to include the simulator and only the bridge
 it seems to be going well but I got the message

 [WARN] [1611390888.801616]: Inbound TCP/IP connection failed: connection from sender terminated before handshake header received. 0 bytes were received. Please check sender for additional details.

I solved the remaining errors by calling in another terminal

```
rosdep init 
 
rosdep update
```
So in conclusion, I don't need to use `unity_simulator_launcher.sh` anymore. I erased anything related to calling this script from any launcher. So  have two new launch files: `server_nosim.launch` and `nosim.launch`.

--------------------


2021 1 30


Initiate new session

```
tmux new -s car_session
```

Ctrl-B "  
Ctrl-B %

31 dec I am trying to implement TL detection but I am not sure if it is working


2021 2 5

light is of the form

header: 
  seq: 0
  stamp: 
    secs: 1612489353
    nsecs: 693876981
  frame_id: "/world"
pose: 
  header: 
    seq: 0
    stamp: 
      secs: 1612489353
      nsecs: 693895101
    frame_id: "/world"
  pose: 
    position: 
      x: 1172.183
      y: 1186.299
      z: 5.576891
    orientation: 
      x: 0.0
      y: 0.0
      z: 0.00061619942315
      w: 0.999999810149
state: 0


