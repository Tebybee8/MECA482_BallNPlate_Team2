# MECA482_BallNPlate_Team2
### MECA 482 Control System Engineering Project
----------------------------------------------------------------------------------

Ball N Plate Control System Design
<p align = "center">
  Project Members:
  Travis Bybee,
  Chris Leach,
  Matt Firpo,
  Alberto Rosales
  </p>
  
  <center>
   <h4> California State University Chico</h4>
   <h4> College of Mechanical and Mechatronic Engineering and Advance Manufacturing</h4> 
   <h4> MECA 482 Control System Engineering</h4> 
   <h4> Ball N Plate</h4> 
</center>

#### Table of Contents
- [1. Introduction](#1-Introduction)
- [2. System Requirements](#2-System-Requirements)
- [3. Mathematical Model](#3-Mathematical-Model) 
- [4. Matlab](#4-Matlab)
- [5. Simulink](#5-Simulink) 
- [6. Coppelia Simulation](#6-Coppelia-Simulation)
- [7. Appendix](#7-Appendix)
- [8. References](#8-References)

## 1. Introduction 
The purpose of this project is to incorporate everything we have learned from this past semester 
in order to create a real life example of a working control system.
The system consists of a plate which can be tilted by two servo motors or electric motors
in two different angular orientations together with a ball rolling around on top of the plate.
The goal was to design a controls system that allows the user to put a ball anywhere on the plate and have the servo motors 
position the ball in the center of the plate.

## 2. System Requirements
![image](https://user-images.githubusercontent.com/73966901/102728961-64bc3f00-42e3-11eb-9743-f7b5b8ce53a8.png)
Figure 1: Excel Spreadsheet including system requirements and dreived values.

The System Requirements of this project were defined by investigating appropriate parameters for this type of system. After discussing as a group, we decided to impliment our system with a 10% response overshoot, and a 5 second settling time. The image above shows the excel sheet that was made to solve for our dampening ratio, natural frequency, as well as our proportional and derivative gains.

## 3. Mathematical Model

Mathematical model:


![X axis](https://user-images.githubusercontent.com/76408602/102729104-1b202400-42e4-11eb-9c73-f05f5cec7f3b.png)

![Y axis](https://user-images.githubusercontent.com/76408602/102729117-2d9a5d80-42e4-11eb-8864-e108e4da781a.png)



This is the block diagram corresponding to one axis of our 2 degrees of freedom ball balancer system. This specific diagram has two loops, the inner loop on the right represents the model of the servo Ps(s), and the ball balancer model. The outer loop on the left is representing the position controller S. The position controller is to be implemented in Simulink and the servo controls and ball balancer models are to be implemented into coppeliasim.


![image](https://user-images.githubusercontent.com/76408602/102729527-ed3bdf00-42e5-11eb-89cf-39afe674f531.png)

![image](https://user-images.githubusercontent.com/76408602/102729539-f7f67400-42e5-11eb-8e89-4ab8fc3016d7.png)

The equations above represent our block diagram respectively for one axis of the 2 degree of freedom ball balancer. It follows the format of a standard second-order system therefore we can go ahead and solve for our proportional gain KP and derivative gain KD using our system parameters of percent overshoot, and settling time. For our system, we’re using a 10% overshoot, with a 4% settling time of 5 seconds, and a Steady-State error of  7.5mm.

In the overall system, the same transfer function will be implemented for the second axis of the 2 degree of freedom ball balancer system. This is a workaround to create a MIMO system by combining multiple SISO systems. One of the diagrams will be for the X-axis, and the other will be for the Y-axis. Therefore the mathematical model for the entire system will be encompassed by both of these equations. 


	The mathematics for our project can be described by the inherent mathematical equation relating to a PID controller. This equation is seen below. 
![image](https://user-images.githubusercontent.com/73966901/102729755-dea1f780-42e6-11eb-826d-b27dee8a6a38.png)

Where KP is the proportional gain, Kiis the integral gain, and K is the derivative gain. This specific system is replicated by a PD controller, meaning Ki is equal to zero. 

## 4. Matlab

## 5. Simulink
Using the proporional and derivative gains solved in section 2, A simulink model was constructed to accurately control the Ball and Plate system. This model can be seen below.

![image](https://user-images.githubusercontent.com/73966901/102729264-df398e80-42e4-11eb-9442-d4bfe9b1ba21.png)
Figure_: Simulink Model of Ball Position controller

This model feeds information of the balls x and y coordinates in the coppeliasim simulation from Matlab into ConstantX and ConstantY respectively. The output blocks X and Y are then recieved in matlab to be fed into the coppeliasim model to set the new joint postions of the X and Y axis servo joints. 

## 6. Coppelia Simulation

The Coppelia Simulation which proves that our algorithms facilitate the designated system requirements...

## 7. Appendix 

A1:

A2:

## 8. References
[1] Nise, Norman S. Control Systems Engineering. Hoboken, NJ: Wiley, 2015. 


