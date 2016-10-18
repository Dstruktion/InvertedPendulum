function source
clear all
clear classes
clc

%% ADDING KEYINFO ayyy lmao
if ~libisloaded('MatlabAsyncKeys')
    loadlibrary('MatlabAsyncKeys',@mproto);
end
keyinfo=@()(calllib('MatlabAsyncKeys','keyinfo'));

%CONSTANTS
L  = 0.5;               %Length
mc = 3;                 %Mass of Cart
mp = 1;                 %Mass of Payload
b  = 0.2;               %Damping factor
g  = 9.81;              %Gravity
Mode = 'Force';         %Velocity or Force
min_cycle = 0.05;       %Minimum cycle time

%PREPARE THE FIGURE WINDOW & GET PENDULUM OBJECT
figure(1); clf
Pend = PENDULUM('InitialStates',[pi 0 0 0], 'WorkspaceLength', 8,'Damping',b,...
    'MassCart', mc, 'MassPendulum', mp, 'PendulumLength',L,'Mode',Mode);

 
%PREPARE THE STREAMING FIGURE WINDOWS
figure(2); clf

subplot(3,1,1);
Stream_Theta = STREAM_AXIS_DATA(gca);
ylabel('\theta')

subplot(3,1,2);
Stream_Pos = STREAM_AXIS_DATA(gca);
ylabel('Position')

subplot(3,1,3);
Stream_Vel = STREAM_AXIS_DATA(gca);
ylabel('Velocity')


%BEGINNING OF SIMULATION LOOP
quit    = 0;
U_fbl   = 0;
del     = min_cycle;


while quit == 0
    
    %KEEP TRACK OF TIME
    now = GETTIME;
    
    %CHECK IF THE ESC, F1 KEY IS BEING PRESSED
    tmp = keyinfo();
    tmp = tmp(1);
    if  tmp == 27
        quit = 1;
    end
    clear tmp
    
    %GET VR FROM THE KEYBOARD
    %37 = left  arrow  %39 = right arrow
    U_manual = GET_MANUAL_COMMAND(37, 39);
    
    %The States
    Q  = Pend.Q;
    
    %Feedback Linearization   
    %U_fbl = ??
    
    %Full State Feedback (from LQR)
    %U_lqr = ??
  
    
    %Actuate the Pendulum    
    Pend.U = U_manual;
    
         
    %Trace states
    Stream_Theta.stream(now, Q(1));
    Stream_Pos.stream(now, Q(3));
    Stream_Vel.stream(now, Q(4));
     
    %update screen
    drawnow
    
    %HANDLE ANY IDLE TIME
    finish = GETTIME;    
    while finish <= now + min_cycle;
        finish = GETTIME;
    end
    del = finish - now;
end


%--------------------------------------------------
function Uout = GET_MANUAL_COMMAND(xm, xp)
umax 	= 1;
U       = 0; 
%% ADDING KEYINFO ayyy lmao
keyinfo=@()(calllib('MatlabAsyncKeys','keyinfo'));

tmp = keyinfo();
if sum(abs(tmp)) ~= 0
    if find(tmp == xp)
        U = U + umax;
    end
    if find(tmp == xm)
        U = U - umax;
    end
end

Uout = U;

%--------------------------------------------------
function out = GETTIME
%time = GETTIME returns the current cpu clock time in milliseconds

tmp = clock;
out = 3600*tmp(4) + 60*tmp(5)+tmp(6);
     


