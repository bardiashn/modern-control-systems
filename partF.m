%----design observer(poles:-8,-10,-10)----%
clc
clear all
%----- PARAMETERS DEFINITION -----
a11=0;
a12=1;
a21=0;
a22=0;
a31=40;
a32=18;
a33=-3;
b1=0;
b2=0;
b3=1;
%----- OPEN-LOOP SYSTEM: X_dot=AX+BU ----
A=[a11 a12 0;a21 a22 1;a31 a32 a33];
B=[b1;b2;b3];
C=[20 9 1];
%-- OBSERVABILITY CHECKING ----
observability_rank=rank(obsv(A,C))
%-- SELECTION OF OBSERVER POLES ----------
P=[-8 -10 -10];
%observer poles are selected 4 times faster than
%closed-loop poles of example 5-3
%-- FINDING OBSERVER GAIN USING Ackermann's Formula --
L_ext=acker(A',C',P);
L=L_ext'; % "L" is the Observer Gain