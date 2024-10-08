close all 
clear all
clc

s = tf('s');
G = 40/((s^2 + 4*s - 9.81)*(1 + 0.001*s));
K_c =  -1.96/s;
C_ss = K_c;

% M_T_LF = 20*log10(0.01/0.1)
% zeta = 0.455;
S_p = 20*log10(1.54);
T_p = 20*log10(1.23);

L1 = G*C_ss;
nichols(L1),hold on
% 
% w_c = 6.26;
% 
% wnorm= 0.9;
% w_z = w_c/wnorm;
% C_z = (1+s/w_z)^2;
% L2 = L1*C_z;
% 
% 
% w_p= 30*w_z;
% C_p = 1/(1+s/w_p);
% L3 = L2*C_p;
% 
% K = db2mag(28);
% L4 = K*L3;
% nichols(L4,'g'),hold on

S_grid(S_p)
T_grid(T_p)
% T_grid(M_T_LF)
% 
% C = zpk(minreal(C_ss*C_z*C_p*K))
% 
% out = sim("LAB8ADAsim.slx")
% plot(out)
% stepinfo(out.y.data,out.y.time)
% 
