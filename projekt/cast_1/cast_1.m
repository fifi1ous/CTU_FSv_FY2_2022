clc; clear; format short g

S = 1
%cast1

%cv.1

A = [1 0 S 3 -1; 0 2*S 1 1 2*S; 2 (S+1)*1 -1 2 3; 3 2 0 0 1; 0 1 2 (S-3)*1 0]
b = [S^2 + 5*S + 5; 6*S + 15; S^2 + 8*S + 17; 6*(S+1); S^2 + 3*S - 4]

x = A'*b

x1 = x(1)
x2 = x(2)
x3 = x(3)
x4 = x(4)
x5 = x(5)
%cv.2

X = [0:2*pi,0.01];
Y = sin(X);

Q = trapz(X,Y)


%cv.3

x = [1.0000 1.2222 1.4444 1.6667 1.8889 2.1111 2.3333 2.5556 2.7778 3.0000]
y = [0.6000 0.6222 0.6444 0.6667 0.6889 0.7111 0.7333 0.7556 0.7778 0.8000]
x0 = 1.5+1/S

vqa = interp1(x,y,x0, "linear")
vqb = interp1(x,y,x0, "spline")
vqc = interp1(x,y,x0, "nearest")

%cv4

syms x 
%a
ya = diff(sqrt(sin(x^2+3*S*x)/S*cos(5*x-6)^2))

%b
syms a  e  phi
yb = diff(a*(1-e^2)*sin(S*phi)/sqrt(1-e^2*sin(S*phi)^2), phi)

%c
syms x

yc = int(S + x^2*sin(S*x)*cos(x)^2)

%d
syms x

yd = int(tan(S*x)^S/cos(S*x)^S,x,0,1/S)

%e
syms phi phi1 phi2 X
T = 1/(1-X^2)^3/2
p = taylor(T,X,'order',10)
q = subs(p,X,(e*sin(phi)))
L1 = int(q, phi, phi1, phi2)

phi1 = 0
phi2 = S*(pi/180)
a = 6378137 
b = 6356752.3142
e = 8.1819190842622*(10^(-1*2))

e == sqrt((a^2-b^2)/(a^2))
L = eval(L1)


%cv.5

x = linspace(-2*pi,2*pi,100);
y = sin(S*x);
figure(1)               
plot(x,y,'r-')	 	
xlabel('x')		
ylabel('y')		
legend('y = sin(x)')    
title('Graf funkce sinus')    
grid on			
axis equal		
xlim([-2*pi 2*pi])	 	
ylim([-1.1 1.1]) 


%cv.6
%%
S=1
x = linspace(-2,2,100);
y = linspace(-2,2,100);
[X,Y]=meshgrid(x,y)
Z = S*tanh(S*Y.*(Y.^4+5*X.^4-10*X.^2.*Y.^2)./(X.^2+Y.^2).^4)
figure
subplot(1,3,1)
mesh(X,Y,Z)
grid on
xlim([-2 2]); ylim([-2 2]); zlim([-1.1 1.1])    
xlabel('x'); ylabel('y'); zlabel('z')
title('Graf typu mesh')
subplot(1,3,2)          
surf(X,Y,Z)
grid on
xlim([-2 2]); ylim([-2 2]); zlim([-1.1 1.1])    
xlabel('x'); ylabel('y'); zlabel('z')
title('Graf typu surf')
subplot(1,3,3)         
contourf(X,Y,Z,15)
grid on
xlim([-2 2]); ylim([-2 2])                      
xlabel('x'); ylabel('y')
title('Graf typu contourf')



