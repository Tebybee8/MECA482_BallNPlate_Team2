clear all
close all
clc
sim=remApi('remoteApi'); % use remote Api to connect to simulink
sim.simxFinish(-1); % just in case, close all opened connections
clientID=sim.simxStart('192.168.56.1',19999,true,true,5000,5); %start connection to Coppelia

if (clientID>-1)
     disp('Connected to remote API server');
     %XCoord = 0.00;
     %YCoord = 0.00;
     set_param('BallPosController', 'SimulationCommand', 'start');
     
     %Object handles
     h=[0,0];
     %get joint information
        [r,h(1)]=sim.simxGetObjectHandle(clientID,'RotateX',sim.simx_opmode_blocking);
        [r,h(2)]=sim.simxGetObjectHandle(clientID,'RotateY0',sim.simx_opmode_blocking);
        [r,h(3)]=sim.simxGetObjectHandle(clientID,'Ball',sim.simx_opmode_blocking);
        
     while true
         %get position of ball
         [r,BallPos]=sim.simxGetObjectPosition(clientID,h(3),-1,sim.simx_opmode_blocking);
         XCoord=BallPos(1);
         YCoord=BallPos(2);         
       
         %Feed Ball Coordinates to control system.
         set_param('BallPosController/ConstantX', 'Value', num2str(XCoord));
         pause(0.005)
         set_param('BallPosController/ConstantY', 'Value', num2str(YCoord));
         pause(0.005)
         
         %Get new joint target positions from control system output
         OutX=get_param('BallPosController/X To Workspace','RuntimeObject');
         NewX=(OutX.InputPort(1).Data *10000);
         OutY=get_param('BallPosController/Y To Workspace','RuntimeObject');
         NewY=(OutY.InputPort(1).Data *10000);

         %Set joint target postions withing coppeliasim
         sim.simxSetJointTargetPosition(clientID,h(1),NewX,sim.simx_opmode_streaming); %set position of Xservo
         sim.simxSetJointTargetPosition(clientID,h(2),NewY,sim.simx_opmode_streaming); %set position of Yservo  
     end 
else
            disp('Failed connecting to remote API server');
end
    sim.delete(); % call the destructor!
    disp('Program ended');
