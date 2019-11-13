close all;
clear all;
clc;

%Coordinates
P1=[1600 0 900];
P2=[2000 500 1600];
P3=[1600 -500 1600];

%Inital values
%P1
x1=1600;
x1dot=0;
x1dotdot=0;

y1=0;
y1dot=0;
y1dotdot=0;

z1=900;
z1dot=0;
z1dotdot=0;

%P2
x2=2000;
x2dot=100;
x2dotdot=10;

y2=500;
y2dot=10;
y2dotdot=10;

z2=1600;
z2dot=10;
z2dotdot=10;

%P3
x3=1600;
x3dot=0;
x3dotdot=0;

y3=-500;
y3dot=0;
y3dotdot=0;

z3=1600;
z3dot=0;
z3dotdot=0;

%Time
T0=0;
T1=1;
T2=2;

t1=[T0:0.1:T1];
t2=[T1:0.1:T2];

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
    x3dot
    x3dotdot];

Y1=[y1
    y1dot
    y1dotdot
    y2
    y2dot];
Y2=[y2
    y2dot
    y2dotdot
    y3
    y3dot
    y3dotdot];

Z1=[z1
    z1dot
    z1dotdot
    z2
    z2dot];
Z2=[z2
    z2dot
    z2dotdot
    z3
    z3dot
    z3dotdot];

F1=[1   T0  T0.^2    T0.^3    T0.^4
    0   1   2*T0     3*T0.^2  4*T0.^3
    0   0   2        6*T0     12*T0.^2
    1   T1  T1.^2    T1.^3    T1.^4
    0   1   2*T1     3*T1.^2  4*T1.^3];

F2=[1   T1  T1.^2    T1.^3    T1.^4    T1.^5
    0   1   2*T1     3*T1.^2  4*T1.^3  5*T1.^4
    0   0   2        6*T1     12*T1.^2 20*T1.^3
    1   T2  T2.^2    T2.^3    T2.^4    T2.^5
    0   1   2*T2     3*T2.^2  4*T2.^3  5*T2.^4
    0   0   2        6*T2     12*T2.^2 20*T2.^3];

CX1=inv(F1)*X1;
CY1=inv(F1)*Y1;
CZ1=inv(F1)*Z1;

CX2=inv(F2)*X2;
CY2=inv(F2)*Y2;
CZ2=inv(F2)*Z2;

p1X=CX1(1)+CX1(2)*t1+CX1(3)*t1.^2+CX1(4)*t1.^3+CX1(5)*t1.^4;
p1Y=CY1(1)+CY1(2)*t1+CY1(3)*t1.^2+CY1(4)*t1.^3+CY1(5)*t1.^4;
p1Z=CZ1(1)+CZ1(2)*t1+CZ1(3)*t1.^2+CZ1(4)*t1.^3+CZ1(5)*t1.^4;

p2X=CX2(1)+CX2(2)*t2+CX2(3)*t2.^2+CX2(4)*t2.^3+CX2(5)*t2.^4+CX2(6)*t2.^5;
p2Y=CY2(1)+CY2(2)*t2+CY2(3)*t2.^2+CY2(4)*t2.^3+CY2(5)*t2.^4+CY2(6)*t2.^5;
p2Z=CZ2(1)+CZ2(2)*t2+CZ2(3)*t2.^2+CZ2(4)*t2.^3+CZ2(5)*t2.^4+CZ2(6)*t2.^5;

TimeResults=[t1 t2];

XResults=[p1X p2X];
YResults=[p1Y p2Y];
ZResults=[p1Z p1Z];

Results=[t1 t2
        p1X p2X
        p1Y p2Y
        p1Z p2Z];

plot3(p1X,p1Y,p1Z);
hold on;
plot3(p2X,p2Y,p2Z);
grid;

% plot3(1600,0,900,'marker', 'x')
text(1600,0,900,'P1')
% hold on
% plot3(2000,500,1600,'marker', 'x')
text(2000,500,1600,'P2')
% hold on
% plot3(1600,-500,1600,'marker', 'x')
text(1600,-500,1600,'P3')
% grid on