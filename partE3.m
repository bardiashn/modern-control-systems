%----design state feedback by integral controler(poles:-1,-1,-1)----%
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
C=[42 13 1];
%----- INTEGRAL CONTROLABILITY ANALYSIS ----------------
[rA,cA]=size(A);
[rB,cB]=size(B);
[rC,cC]=size(C);
A_bar=[A zeros(rA,1);-C zeros(rC,1)];
B_bar=[B;zeros(rC,cB)];
Integral_controlability_rank=rank(ctrb(A_bar,B_bar))
%----- STATE FEEDBACK DESIGN ------------
P=[-1 -1 -1 -0.5]; % Desired Closed-Loop Ploes
K=acker(A_bar,B_bar,P); % State-Feedback Gain
K1=K(1:rA);
K2=K(rA+1:rA+rC);