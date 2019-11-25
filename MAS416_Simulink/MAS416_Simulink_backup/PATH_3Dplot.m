clc
clear all
close all

%% Coordinates
P1=[1.6 0 0.9];
P2=[2 0.5 1.6];
P3=[1.6 -0.5 1.6];
P4=[1.6 0 0.9];
T0=0;
T1=1;
T2=2;
T3=3;

%% P1
x1=P1(1);
x1dot=0;
x1dotdot=0;

y1=P1(2);
y1dot=0;
y1dotdot=0;

z1=P1(3);
z1dot=0;
z1dotdot=0;

%% P2
x2=P2(1);
x2dot=0.5;
x2dotdot=0.010;

y2=P2(2);
y2dot=0.010;
y2dotdot=0.010;

z2=P2(3);
z2dot=0.010;
z2dotdot=0.010;

%% P3
x3=P3(1);
x3dot=-0.55;
x3dotdot=0;

y3=P3(2);
y3dot=0.05;
y3dotdot=0;

z3=P3(3);
z3dot=-0.55;
z3dotdot=0;

%% P4
x4=P4(1);
x4dot=0;
x4dotdot=0;

y4=P4(2);
y4dot=0;
y4dotdot=0;

z4=P4(3);
z4dot=0;
z4dotdot=0;


%% Path Generator
t1=[T0:0.1:T1];
t2=[T1:0.1:T2];
t3=[T2:0.1:T3];

Step=0.1;
Counter=1;

X1=[x1
    x1dot
    x1dotdot
    x2
    x2dot];

X2=[x2
    x2dot
    x2dotdot
    x3
    x3dot];

X3=[x3
    x3dot
    x3dotdot
    x4
    x4dot
    x4dotdot];


Y1=[y1
    y1dot
    y1dotdot
    y2
    y2dot];

Y2=[y2
    y2dot
    y2dotdot
    y3
    y3dot];

Y3=[y3
    y3dot
    y3dotdot
    y4
    y4dot
    y4dotdot];


Z1=[z1
    z1dot
    z1dotdot
    z2
    z2dot];
Z2=[z2
    z2dot
    z2dotdot
    z3
    z3dot];
Z3=[z3
    z3dot
    z3dotdot
    z4
    z4dot
    z4dotdot];



F1=[1   T0  T0.^2    T0.^3    T0.^4
    0   1   2*T0     3*T0.^2  4*T0.^3
    0   0   2        6*T0     12*T0.^2
    1   T1  T1.^2    T1.^3    T1.^4
    0   1   2*T1     3*T1.^2  4*T1.^3];

F2=[1   T1  T1.^2    T1.^3    T1.^4    
    0   1   2*T1     3*T1.^2  4*T1.^3  
    0   0   2        6*T1     12*T1.^2 
    1   T2  T2.^2    T2.^3    T2.^4    
    0   1   2*T2     3*T2.^2  4*T2.^3];  


F3=[1   T2  T2.^2    T2.^3    T2.^4    T2.^5
    0   1   2*T2     3*T2.^2  4*T2.^3  5*T2.^4
    0   0   2        6*T2     12*T2.^2 20*T2.^3
    1   T3  T3.^2    T3.^3    T3.^4    T3.^5
    0   1   2*T3     3*T3.^2  4*T3.^3  5*T3.^4
    0   0   2        6*T3     12*T3.^2 20*T3.^3];

CX1=inv(F1)*X1;
CY1=inv(F1)*Y1;
CZ1=inv(F1)*Z1;

CX2=inv(F2)*X2;
CY2=inv(F2)*Y2;
CZ2=inv(F2)*Z2;

CX3=inv(F3)*X3;
CY3=inv(F3)*Y3;
CZ3=inv(F3)*Z3;


p1X=CX1(1)+CX1(2)*t1+CX1(3)*t1.^2+CX1(4)*t1.^3+CX1(5)*t1.^4;
p1Y=CY1(1)+CY1(2)*t1+CY1(3)*t1.^2+CY1(4)*t1.^3+CY1(5)*t1.^4;
p1Z=CZ1(1)+CZ1(2)*t1+CZ1(3)*t1.^2+CZ1(4)*t1.^3+CZ1(5)*t1.^4;

p2X=CX2(1)+CX2(2)*t2+CX2(3)*t2.^2+CX2(4)*t2.^3+CX2(5)*t2.^4;
p2Y=CY2(1)+CY2(2)*t2+CY2(3)*t2.^2+CY2(4)*t2.^3+CY2(5)*t2.^4;
p2Z=CZ2(1)+CZ2(2)*t2+CZ2(3)*t2.^2+CZ2(4)*t2.^3+CZ2(5)*t2.^4;

p3X=CX3(1)+CX3(2)*t3+CX3(3)*t3.^2+CX3(4)*t3.^3+CX3(5)*t3.^4+CX3(6)*t3.^5;
p3Y=CY3(1)+CY3(2)*t3+CY3(3)*t3.^2+CY3(4)*t3.^3+CY3(5)*t3.^4+CY3(6)*t3.^5;
p3Z=CZ3(1)+CZ3(2)*t3+CZ3(3)*t3.^2+CZ3(4)*t3.^3+CZ3(5)*t3.^4+CZ3(6)*t3.^5;

TimeResults=[t1 t2 t3];

XResults=[p1X p2X p3X];
YResults=[p1Y p2Y p3Y];
ZResults=[p1Z p2Z p3Z];

Results=[t1 t2 t3
        p1X p2X p3X
        p1Y p2Y p3Y
        p1Z p2Z p3Z];
    
plot3(p1X,p1Y,p1Z);
hold on;
plot3(p2X,p2Y,p2Z);
plot3(p3X,p3Y,p3Z);
grid;
xlabel('x')
ylabel('y')
zlabel('z')

% plot3(1600,0,900,'marker', 'x')
text(1.6,0,0.9,'P1')
% hold on
% plot3(2000,500,1600,'marker', 'x')
text(2,0.5,1.6,'P2')
% hold on
% plot3(1600,-500,1600,'marker', 'x')
text(1.6,-0.5,1.6,'P3')
% grid on