clear all
close all 
clc

s = tf('s');
G = 1.9837/((1+s/142)*(1+s/14.2));
K_c = 1/s;
C_ss = K_c;

L1 = C_ss*G;
nichols(L1,'r'),hold on

zeta = 0.52;
T_p = 20*log10(1.13);
S_p = 20*log10(1.44);
M_T_LF = 20*log10(0.0018/0.1);

T_grid(T_p);
S_grid(S_p);
T_grid(M_T_LF)

w_c = 27.2;
md = 10
wnorm = 1.2;
w_d = w_c/wnorm
C_d = ((1+s/(w_d)/(1+s/(md*w_d))));

L2 = L1*C_d
nichols(L2,'b')

K = db2mag(29)
L3 = L2*K;
nichols(L3,'m'),hold on

C = C_ss*K*C_d;

out = sim("LAB9ADAsim.slx")
plot(out)
stepinfo(out.y.data,out.y.time)


