clc; clear; format long G
px = 0.25;
vln=633*10^(-9);
w1=pi/2;

cs=[pwd filesep 'I_rovina_1.mat'];
I=load(cs);      
I1=I.I;                       
cs=[pwd filesep 'I_rovina_2.mat'];
I=load(cs);      
I2=I.I; 
cs=[pwd filesep 'I_rovina_3.mat'];
I=load(cs);      
I3=I.I; 
cs=[pwd filesep 'I_rovina_4.mat'];
I=load(cs);      
I4=I.I; 
cs=[pwd filesep 'I_rovina_5.mat'];
I=load(cs);      
I5=I.I; 

x = (1:size(I1, 2))*px;
y = (1:size(I1, 1))*px;
[X1, Y1] = meshgrid(x, y);

figure (1)
subplot (1,5,1)
pcolor(X1,Y1,I1)
shading interp
colormap gray
axis equal tight
xlabel('x')
ylabel('y')
title('Interferogram 1')

subplot (1,5,2)
pcolor(X1,Y1,I2)
shading interp
colormap gray
axis equal tight
xlabel('x')
ylabel('y')
title('Interferogram 2')

subplot (1,5,3)
pcolor(X1,Y1,I3)
shading interp
colormap gray
axis equal tight
xlabel('x')
ylabel('y')
title('Interferogram 3')

subplot (1,5,4)
pcolor(X1,Y1,I4)
shading interp
colormap gray
axis equal tight
xlabel('x')
ylabel('y')
title('Interferogram 4')

subplot (1,5,5)
pcolor(X1,Y1,I5)
shading interp
colormap gray
axis equal tight
xlabel('x')
ylabel('y')
title('Interferogram 5')

fi=atan2((2*(I2-I4)),(2*I3-I1-I5));
fi = f_unwrapping( fi );
w=vln/(2*pi)*fi;
p=1; m=41; d=40;
[U,Y,X]=sit(p,m,d);
x=reshape(X,41*41,1); y=reshape(Y,41*41,1); w1=reshape(w,41*41,1);

A=[ones(length(x),1), x, y];
q=(A'*A)\(A'*w1);
Wz=q(1,1)+q(2,1)*x+q(3,1)*y;
[sig_q]=MNC2 (A,Wz);
wz=reshape(Wz,41,41);
odch=wz-w;

figure (2)
subplot(2,2,1)
mesh(X,Y,w);
subplot(2,2,2)
mesh(X,Y,wz)
subplot(2,1,2)
histogram(odch)