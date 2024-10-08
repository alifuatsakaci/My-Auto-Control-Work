close all
clear all
clc

s = tf('s');
G = 10/((s)*(s+5)*(s+10));
K_c = 5;
C_ss = K_c;

L1 = G*C_ss;
nichols(L1,'r'), hold on
 T_p = 20*log10(1.03);
 S_p = 20*log10(1.335);

 T_grid(T_p)
 S_grid(S_p)
 w_c = 6;

 wnorm = 1.2;
 w_z = w_c/wnorm;
 C_z = 1 + s/w_z;
L2 = L1*C_z;
nichols(L2,'b'), hold on

w_p = 20*w_z;
C_p = 1/(1 + s/w_p);
L3 = L2*C_p;
nichols(L3,'m'), hold on

K = db2mag(12.5);
L4 = L3*K;
nichols(L4,'g'), hold on

C = zpk(minreal(C_ss*C_z*C_p*K));
out = sim("LAB6ADAsim.slx")
plot(out)
stepinfo(out.y.data,out.y.time) 

