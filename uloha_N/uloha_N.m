clc; clear; format long G
load("data.mat");
load("data3d.mat");
%% index lomu
sp=0.4; hr=1.059; NA=0.15; d=1;
delta=hr-sp;
delta=delta/1000; d=d/1000;
N=sqrt((d^2/delta^2)*(1-NA^2)+NA^2);
%% 3D tisk deska
xA=data3d(:,1);
yA=data3d(:,2);
zA=data3d(:,3);

CA=[ones(length(xA),1),xA,yA];
qA=inv(CA'*CA)*CA'*zA;
DA=CA*qA;

del=49;
p=min(xA);
M=max(xA);
[Y1,X1]=sit(p,M,del);
Z1=qA(1)+qA(2)*X1+qA(3)*Y1;

eA=zA-DA;
RzA=max(eA)-min(eA);
RaA=sum(abs(eA))/length(eA);
RqA=sqrt(sum(eA.^2)/length(eA));
%% planpalerní deska
xP=data(:,1);
yP=data(:,2);
zP=data(:,3);

CP=[ones(length(xP),1),xP,yP];
qP=inv(CP'*CP)*CP'*zP;
DP=CP*qP;

p=min(xP);
M=max(xP);
[Y2,X2]=sit(p,M,del);
Z2=qP(1)+qP(2)*X1+qP(3)*Y1;

eP=zP-DP;
RzP=max(eP)-min(eP);
RaP=sum(abs(eP))/length(eP);
RqP=sqrt(sum(eP.^2)/length(eP));
%%
figure
subplot(1,2,1)
scatter3(xP,yP,zP,1,zP)
hold on
mesh(X2,Y2,Z2,"FaceColor",'k','EdgeColor','k')
hold off

subplot(1,2,2)
scatter3(xA,yA,zA,1,zA)
hold on
mesh(X1,Y1,Z1,"FaceColor",'k','EdgeColor','k')
hold off