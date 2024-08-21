clc; clear; format long G;

g2=[0,1,0]; alpha13=90; s0=[1,1,1]; n=1;
delta12=0; delta23=0; 

[g,G]=ned_hran(g2,alpha13,delta12,delta23);
[s1]=kout_odraz_mat(s0,n,g,G);

z=dot(s0,s1)/(norm(s0)*norm(s1));
theta=acosd(z)