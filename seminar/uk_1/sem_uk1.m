clc; clear ; format long g
n1=1; n2=1.5;
eps1=linspace(0,pi/2,100);
eps2=asin((sin(eps1)*n1)/n2);
epsp=eps1+eps2; epsm=eps1-eps2;
S1=sin(epsm).^2; S2=sin(epsp).^2;
T1=tan(epsm).^2; T2=tan(epsp).^2;
R=1/2*(S1./S2+T1./T2);
R1=R*100;
epsd=eps1/pi*180;

n3=1.5; n4=1;
eps3=linspace(0,0.7297276562,100);
eps4=asin(sin((eps3))*n3/n4);
epsp1=eps3+eps4; epsm1=eps3-eps4;
S3=sin(epsm1).^2; S4=sin(epsp1).^2;
T3=tan(epsm1).^2; T4=tan(epsp1).^2;
R2=1/2*(S3./S4+T3./T4);
R3=R2*100;
epsd1=eps3/pi*180;

figure(1)
plot(epsd,R1,'b-',epsd1,R3,'r-','LineWidth',2)
ylabel('% odrazu paprsku')
xlabel('Úhel dopadu')
title('Výpočet odrazivosti pro různé úhly')
grid on
legend('n1<n2','n1>n2')
xlim([0 90]); ylim([0 100]);
