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
- [2. Mathematical Model and System Requirements](#2-Mathematical-Model-and-System-Requirements) 
- [3. Matlab](#3-Matlab)
- [4. Simulink](#4-Simulink) 
- [5. CoppeliaSim Model](#5-CoppeliaSim-Model)
- [6. Conclusion](#6-Conclusion)
- [7. References](#7-References)

## 1. Introduction 
The purpose of this project is to incorporate everything we have learned from this past semester 
in order to create a real life example of a working control system.
The system consists of a plate which can be tilted by two servo motors or electric motors
in two different angular orientations together with a ball rolling around on top of the plate. A simple one dimensional representation of this system can be seen below.
![image](https://user-images.githubusercontent.com/73966901/102730966-5114d680-42eb-11eb-83c6-afef2afb3c09.png)
**Figure 1:** One dimensional Ball and Plate System[1]

The goal of this porject was to design a control system that allows the user to put a ball anywhere on the plate and have the system
position and balance the ball in a user defined location.

Using **Fig. 1** we can find the relationship between the servo load gear angle theta(L), as well as the correlation between the beam and the angle of the servo.
 
 
 ![image](https://user-images.githubusercontent.com/73966901/102739756-d9eb3c80-4302-11eb-93e4-1777f0b536a4.png)
 
 **Figure 2:** Sine of the beam angle. 
 
 
 ![image](https://user-images.githubusercontent.com/73966901/102739849-174fca00-4303-11eb-9324-a4479c42e1b7.png)
 
 **Figure 3:** Sine of the Beam and Servo Angle
 
 
 **Fig. 2** and **Fig. 3** are then used to obtain the equation depicted in **Fig. 4.**
 
 
 ![image](https://user-images.githubusercontent.com/73966901/102739897-30f11180-4303-11eb-9709-94ce0838d4e6.png)
 
 **Figure 4:** Relationship between the beam and servo angle.
 
 
 Assuming the servo angle is zero to linearize the equation of motion, we can then incorporate this equation into **Fig. 5**, the equation of linear acceleration of the ball and beam system.
 
 
 ![image](https://user-images.githubusercontent.com/73966901/102741108-53d0f500-4306-11eb-9c5e-258060bcf4ef.png)
 
 **Figure 5:** Equation of Linear Acceleration of the Ball and Beam System
 
 
 After combining **Fig. 4** and **Fig. 5** we can produce the non linear equation of motion of the ball
 
 
 ![image](https://user-images.githubusercontent.com/73966901/102739911-3cdcd380-4303-11eb-92c6-8e4986ebc520.png)
 
 **Figure 6:** Linear Equation of Motion of the Ball


If we then make a small angle approximation, we can then linearize this equation.


 ![image](https://user-images.githubusercontent.com/73966901/102739922-45350e80-4303-11eb-96bb-79eec8ef5819.png)
 
 **Figure 7:** Linear Equation of Motion of the Ball 


 The equation in **Fig. 7** was used later to find the overall mathematical model of our system and assist in defining the necessary proportional and derivative gains to meet our system requirements. 

## 2. Mathematical Model and System Requirements

Mathematical model:


![X axis](https://user-images.githubusercontent.com/76408602/102729104-1b202400-42e4-11eb-9c73-f05f5cec7f3b.png)

**Figure 8:** Control block x

![Y axis](https://user-images.githubusercontent.com/76408602/102729117-2d9a5d80-42e4-11eb-8864-e108e4da781a.png)

**Figure 9:** Control block y


This is the block diagram corresponding to one axis of our two degrees of freedom ball balancer system. This specific diagram has two loops, the inner loop on the right represents the model of the servo Ps(s), and the ball balancer model. The outer loop on the left is representing the position controller S. The position controller is to be implemented in Simulink and the servo controls and ball balancer models are to be implemented into coppeliasim. 


![image](https://user-images.githubusercontent.com/76408602/102729527-ed3bdf00-42e5-11eb-89cf-39afe674f531.png)

**Figure 10:**  

![image](https://user-images.githubusercontent.com/76408602/102729539-f7f67400-42e5-11eb-8e89-4ab8fc3016d7.png)

**Figure 11:**

The equations above represent our block diagram respectively for one axis of the 2 degree of freedom ball balancer. It follows the format of a standard second-order system therefore we can go ahead and solve for our proportional gain KP and derivative gain KD using our system parameters of percent overshoot, and settling time.

![image](https://user-images.githubusercontent.com/76408602/102739960-63027380-4303-11eb-85cb-0ae19d9d9d41.png)

**Figure 12:** Percent Overshoot Formula

![image](https://user-images.githubusercontent.com/76408602/102739914-3d756a00-4303-11eb-93d4-f6d4d12dca5e.png)

**Figure 13:** Settling Time Formula

In the overall system, the same transfer function will be implemented for the second axis of the 2 degree of freedom ball balancer system. This is a workaround to create a MIMO system by combining multiple SISO systems. One of the diagrams will be for the X-axis, and the other will be for the Y-axis. Therefore the mathematical model for the entire system will be encompassed by both of these equations. 


	The mathematics for our project can be described by the inherent mathematical equation relating to a PID controller. This equation is seen below. 
![image](https://user-images.githubusercontent.com/73966901/102729755-dea1f780-42e6-11eb-826d-b27dee8a6a38.png)

Where KP is the proportional gain, Ki is the integral gain, and K is the derivative gain. This specific system is replicated by a PD controller, meaning Ki is equal to zero. 


![image](https://user-images.githubusercontent.com/73966901/102728961-64bc3f00-42e3-11eb-9743-f7b5b8ce53a8.png)

**Figure 14:** Excel Spreadsheet including system requirements and dreived values.

The System Requirements of this project were defined by investigating appropriate parameters for this type of system. After discussing as a group, For our system, we’re using a 10% overshoot, with a 4% settling time of 5 seconds, and a Steady-State error of  7.5mm. The image above shows the excel sheet that was made to solve for our dampening ratio, natural frequency, as well as our proportional and derivative gains.

## 3. Matlab
![image](https://user-images.githubusercontent.com/73966901/102730315-2b86cd80-42e9-11eb-8d13-1e664e79a659.png)
![image](https://user-images.githubusercontent.com/73966901/102730483-cda6b580-42e9-11eb-847c-a11167338003.png)
**Figure 14:** Matlab Code for BallNPlate System

For this system, the ball position controllers were implimented in simulink for each axis of the system, and the servo model and potential controller was utilized in coppeliasim. Matlab acted as the commuinication tool for this system, as it needed to pull information from coppeliasim, as well as feed and retrieve information to and from simulink in order for the system to work in harmony. Lines 1-6 show the remote connection to the coppeliasim model through remoteApi. Line 12 starts the BallPosController Simulink Model. Lines 17-23 get the object handles of the 2 servo joints, as well as the ball, before retrieving the coordinates of the ball with the simxGetObjectPosition() function. These coordinates are then fed into the ball posiiton controller in lines 28-31. In lines 34-37, the matlab code is recieving the data from the simulink models output blocks X and Y. These new x and y values are then fed back into the coppelia sim model with the simxSetJointTargetPosition() function.

## 4. Simulink
Using the proporional and derivative gains solved in section 2, A simulink model was constructed to accurately control the Ball and Plate system. This model can be seen below.

![image](https://user-images.githubusercontent.com/73966901/102729264-df398e80-42e4-11eb-9442-d4bfe9b1ba21.png)
**Figure 15:** Simulink Model of Ball Position controller

This model feeds information of the balls x and y coordinates in the coppeliasim simulation from Matlab into ConstantX and ConstantY respectively. The output blocks X and Y are then recieved in matlab to be fed into the coppeliasim model to set the new joint postions of the X and Y axis servo joints. 

## 5. CoppeliaSim Model
The following image shows the provided CoppeliSim Model to test our control system.
![image](https://user-images.githubusercontent.com/73966901/102730782-adc3c180-42ea-11eb-98c4-9697a727820b.png)
**Figure 16:** CoppeliaSim Model


## 6. Conclusion
Our team was very close to producing a working system, however there was one small error within our BallPosController model that we were unable to understand. The video seen in the repository shows that we were able to interact with the system and that the system responds to the location of the ball, but also demonstrates that something is wrong with the system. After displaying the information imported and exported from the simulink model, it was clear that the issue is within the controller. If time permitted we would be able to refine the controller to ensure a responsive system that facilitates the defined system parameters.

## 7. References
[1] Nise, Norman S. Control Systems Engineering. Hoboken, NJ: Wiley, 2015. 

[2] Quanser inc. 2 DOF Ball Balancer Woorkbook, 2013.

