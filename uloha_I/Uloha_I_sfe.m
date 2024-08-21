clc; clear; format long G
px = 0.25;
vln=633*10^(-8);
w1=2*pi/3;

cs=[pwd filesep 'I_sfera_1.mat'];
I=load(cs);      
I1=I.I;                       
cs=[pwd filesep 'I_sfera_2.mat'];
I=load(cs);      
I2=I.I; 
cs=[pwd filesep 'I_sfera_3.mat'];
I=load(cs);      
I3=I.I;  

x = (1:size(I1, 2))*px;
y = (1:size(I1, 1))*px;
[X1, Y1] = meshgrid(x, y);
x = (1:size(I2, 2))*px;
y = (1:size(I2, 1))*px;
[X2, Y2] = meshgrid(x, y);
x = (1:size(I3, 2))*px;
y = (1:size(I3, 1))*px;
[X3, Y3] = meshgrid(x, y);

figure
subplot (1,3,1)
pcolor(X1,Y1,I1)
shading interp
colormap gray
axis equal tight
xlabel('x')
ylabel('y')
title('Interferogram 1')

subplot (1,3,2)
pcolor(X2,Y2,I2)
shading interp
colormap gray
axis equal tight
xlabel('x')
ylabel('y')
title('Interferogram 2')

subplot (1,3,3)
pcolor(X3,Y3,I3)
shading interp
colormap gray
axis equal tight
xlabel('x')
ylabel('y')
title('Interferogram 3')

fi=atan2((I1-2*I2+I3),(sqrt(3)*(I1-I3)));
fi = f_unwrapping( fi );
w=vln/(2*pi)*fi;
p=1; m=41; d=40;
[O1,X,Y]=sit(p,m,d);
x=reshape(X,41*41,1); y=reshape(Y,41*41,1); w1=reshape(w,41*41,1);
H=[x,y,w1];
H=sortrows(sortrows(H,1,"descend"),2);
x=H(:,1); y=H(:,2); w2=H(:,3);
r1=x.^2+y.^2+w2.^2;
[H1]=rozdil(H);
[r2]=rozdil(r1);
r3=r2*(1/2);
q = (H1'*H1)\(H1'*r3);
[sig_q]=MNC2 (H1,r3);
for i=1:size(H,1)
    POL(i)=sqrt((x(i,1)-q(1,1))^2+(y(i,1)-q(2,1))^2+(w1(i,1)-q(3,1))^2);
end
POL_Prum=mean(POL);
H2=[x,y];
[Z]=soz(H2,q,POL_Prum);
z=reshape(Z,41,41);
odch=z-w;

figure (2)
subplot(2,2,1)
mesh(X,Y,w)
subplot(2,2,2)
mesh(X,Y,z)
subplot(2,1,2)
histogram(odch)
