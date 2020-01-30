%----design feedback controler(pole:-3,-4,5)----%
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
A=[a11 a12 0;a21 a22 1;a31 a31 a33];
B=[b1;b2;b3];
%----- OPEN-LOOP ANALYSIS ----------------
openloop_eigenvalues=eig(A);
controlability_rank=rank(ctrb(A,B));
%----- STATE FEEDBACK DESIGN ------------
P=[-3 -4 -5];
% Desired Closed-Loop Ploes
K8=acker(A,B,P); % State-Feedback Gain