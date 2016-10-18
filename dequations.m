function qdot = dequations(T,q,u,L,mp,mc,b,Mode)

%Define some parameters that we can use in our differential equations.

mt = mp+mc;
g = 9.81;
t = q(1);
w = q(2);
x = q(3);
v = q(4);
st = sin(t);
ct = cos(t);

switch Mode
    
    case 'Force'
        F = u;
        qdot(1,1) = w;
        qdot(2,1) = 0;
        qdot(3,1) = v;
        qdot(4,1) = 0;     

    case 'Velocity' %these equations are actually for acceleration control, but the mode
        %for the pendulum class says velocity, and we just differentiate.
        A = u;
        qdot(1,1) = 0;
        qdot(2,1) = 0;
        qdot(3,1) = v;
        qdot(4,1) = A; 
end


