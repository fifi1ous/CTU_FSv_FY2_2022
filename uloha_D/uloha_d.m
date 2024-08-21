clc; clear;
fid=fopen('data.txt','r');
data=fscanf(fid,'%f %f %f\n',[3 inf])';
fclose(fid);
data(:,3)=data(:,3)./368;

[x]=find(data(:,1)==90);
R=sortrows(data(x,2:3));
VR=R(:,1)./180.*pi; VR1=R(:,2);
figure (1)
polarplot(VR,VR1)

[Y1]=find(data(:,2)==0); [Y2]=find(data(:,2)==180);
R2=data(Y1,1:3);
R1=data(Y2,1:3);
for n=1:length(R1)
    if R1(n,2)==180
    R1(n,1)=360-R1(n,1);
    end
end
R1=sortrows(R1,"descend");
SR=R1(:,1)./180.*pi; SR1=R1(:,3);
R2=sortrows(R2);
SR_=R2(:,1)./180.*pi; SR2=R2(:,3);

figure(2)
ax=polaraxes;
polarplot(SR_,SR2,'b')
rlim([0,1.2]);
ax.ThetaZeroLocation='top';
hold on
polarplot(SR,SR1,'b')
hold off

data=sortrows(sortrows(data,2),1);
zar=data(:,3); zar=reshape(zar,13,13);
data1=cosd(data(:,1));data1=reshape(data1,13,13);
rho=sind(data(:,1));rho=reshape(rho,13,13);
theta=(data(:,2))/180*pi; theta=reshape(theta,13,13);
[x,y,z]=pol2cart(theta,rho,data1);
figure (3)
mesh(x,y,z,zar,"FaceColor","flat","EdgeColor",'k')
colorbar
%%
s=importdata("s.Master.Sample");
d=importdata("d.Master.Dark");
r=importdata("r.Master.Reference");
i=importdata("i.Master.Irradiance");

t=3100;
c1=3.74177*(10^(-16));1.43878*(10^(-2));
c2=1.43878*(10^(-2));
m=ones(size(s,1),1);

for n=1:length(m)
    m(n,1)=(c1/((s(n,1)*10^(-9))^5))*((exp((c2/((s(n,1)*10^(-9))*t))-1))^(-1));
end

n=1/m(end,1);
b=m*n;
I=ones(size(i,1),1);
for n=1:length(I)
    I(n,1)=b(n,1)*((s(n,2)-d(n,2))/(r(n,2)-d(n,2)));
end
IP=I/I(end,1);
IK=i(:,2)/i(end,2);
vlndelka=s(:,1);

figure (4)
subplot(2,2,1)
plot(vlndelka,IP,'r')
xlim([min(s(:,1)),max(s(:,1))])
ylim([-0.02,1.5])
grid on
title('grafické zobrazení spektra')

subplot(2,2,2)
plot(vlndelka,IK,'g')
xlim([min(s(:,1)),max(s(:,1))])
grid on
title('grafické zobrazení spektra')

subplot(2,2,3)
plot(vlndelka,s(:,2),'b')
xlim([min(s(:,1)),max(s(:,1))])
grid on
title('signal vzorku')

subplot(2,2,4)
plot(vlndelka,r(:,2),'k')
xlim([min(s(:,1)),max(s(:,1))])
ylim([-0.200,4000])
grid on
title('referencni signál')


