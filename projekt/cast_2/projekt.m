clc; clear;
data = importdata('data_zadani_2.csv');

X=data(:,1); Y=data(:,2); Z=data(:,3);
r=sqrt(X.^2+Y.^2);
A = [ones(length(r),1), r.^2, r.^4];
q = (A'*A)\(A'*Z);

z=q(1)+q(2)*r.^2+q(3)*r.^4;
O=Z;P=A;
[sig_q]=MNC2(P,O);

Odch=Z-z;
X=reshape(X,11,11);
Y=reshape(Y,11,11);
z1=reshape(z,11,11);
for t=1:length(q)
Nadpis{t} = [num2str(q(t)),'±','(',num2str(sig_q(t)),')'];
end

figure
subplot(1,2,1)
mesh(X,Y,z1);
title(Nadpis)

subplot(1,2,2)
histogram(Odch);
