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
Then I discovere that the requirements file *did not need to include numpy* since it was already installed. So I erased numpy from requirements and build the image 






## Problems when running the simulator

When trying to run the simulator by using the file unity_simulator_launcher.sh
I got two problems: 

* The first one is that for some reason I can not select the file sys_int.x86. The program does not recognize it 
as a file

* the second is that for the file sys_init.x86_64, it recognizes it as a file but then  I got the error

Got a SIGABRT while executing native code. This usually indicates
a fatal error in the mono runtime or one of the native libraries 
used by your application.

I suspect this is because of users and permissions

cat /etc/passwd|grep 1000
 shows no user 1000

 https://medium.com/redbubble/running-a-docker-container-as-a-non-root-user-7d2e00f8ee15


 Note: I think I have been able to run the simulator by double-clicking the file, (previously made executable)

 