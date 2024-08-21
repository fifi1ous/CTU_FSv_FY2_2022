clc; clear variables; close all; format short g
% 1
importdata zadani_3_1.csv;
data=ans;
t=data(:,1);
I=data(:,2);
% 2
windowSize=10; 
b=(1/windowSize)*ones(1,windowSize);
a=1;
t_f=filter(b,a,t);
I_f=filter(b,a,I);
% 3
RMS=sqrt(sum((I-I_f).^2)/length(I));
% 4
I_norm=(I_f-min(I_f))/max((I_f-min(I_f)));
%5
for i=1:length(I_norm)
    if I_norm(i)<3*RMS
       I_norm(i)=0;
    else
       I_norm(i)=I_norm(i);
    end
end
M=[t,I_norm];
%6
P=trapz(I_norm);
tau=(1/P)*trapz(t.*I_norm);
tau_2=(1/P)*trapz((t.^2).*I_norm);
ut=sqrt(tau_2-tau^2);
%7
c=3e8;
L=(c*t)/2;
uL=(c/2)*ut;
%8
dlmwrite('myFile.txt',M,'delimiter',',','precision','%1.15f');


