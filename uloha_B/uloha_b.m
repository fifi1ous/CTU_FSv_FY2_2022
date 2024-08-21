clc; clear; 
A=load("cocka2.txt");

A=sortrows(A,2);
X=A(:,1); Y=A(:,2); Z=A(:,3);

r1=X.^2+Y.^2+Z.^2;
[A1]=rozdil(A);
[r2]=rozdil(r1);
r3=r2*(1/2);

q = (A1'*A1)\(A1'*r3);
for i=1:length(A)
    POL(i)=sqrt((X(i,1)-q(1,1))^2+(Y(i,1)-q(2,1))^2+(Z(i,1)-q(3,1))^2);
end
POL_Prum=mean(POL);

M=30; D=30; P=-20; 
[H,X1,Y1]=sit(P,M,D);
[ZM]=soz(H,q,POL_Prum);
U=length(X1);

[sig_q]=MNC2 (A1,r3);
Q=[q,sig_q];

z=reshape(ZM,U,U);

mesh(X1,Y1,z)
%zlim([0,8])
%% měření pomocí sférometru
D=[24;20;16]; REF=[0.51;0.80;1.44]; h=[1.47,1.47,1.47;1.47,1.47,1.47;1.87,1.87,1.87];
[r,s]=size(h);
R=ones(r,s);
for n=1:r
    for m=1:s
        R(n,m)=((D(n,1)/2)^2+(h(n,m)-REF(n,1))^2)/(2*(h(n,m)-REF(n,1)));
    end
    Ua(n)=std(R(n,:));
    Ub(n)=0.01/sqrt(12);
    Uc(n)=sqrt((Ua(n)^2+Ub(n)^2)/s);
    Ucp(n)=sqrt(((((D(n)/2)^2)/(4*mean(h(n,:))-4*REF(n)))*Uc(n)^2)+(((32*mean(h(n,:))^2-64*mean(h(n,:))*REF(n)+32*REF(n)^2-8*D(n)^2)/(8*mean(h(n,:))-8*REF(n))^2)*Uc(n)^2)+(((-32*mean(h(n,:))^2+64*mean(h(n,:))*REF(n)-32*REF(n)^2+8*D(n)^2)/(8*mean(h(n,:))-8*REF(n))^2)*Uc(n)^2))*1.96;
end
R1=mean(mean(R')');
nej_sfe=sqrt((1/3)^2*Ucp(1,1)^2+(1/3)^2*Ucp(1,2)^2+(1/3)^2*Ucp(1,3)^2)*1.96;
sfe=[R1,nej_sfe];
%% nejistoty
Ucx=sqrt((1/sqrt(12))^2);Ucy=sqrt((1/sqrt(12))^2);Ucz=sqrt((0.01/sqrt(12))^2);
cx1=(((A(10,1)-q(1,1))/sqrt((A(10,1)-q(1,1))^2+(A(10,2)-q(2,1))^2+(A(10,3)-q(3,1))^2))^2)*(Ucx^2);
cx2=(((-A(10,1)-q(1,1))/sqrt((A(10,1)-q(1,1))^2+(A(10,2)-q(2,1))^2+(A(10,3)-q(3,1))^2))^2)*(sig_q(1,1)^2);
cy1=(((A(10,2)-q(2,1))/sqrt((A(10,1)-q(1,1))^2+(A(10,2)-q(2,1))^2+(A(10,3)-q(3,1))^2))^2)*(Ucy^2);
cy2=(((-A(10,2)-q(2,1))/sqrt((A(10,1)-q(1,1))^2+(A(10,2)-q(2,1))^2+(A(10,3)-q(3,1))^2))^2)*(sig_q(2,1)^2);
cz1=(((A(10,3)-q(3,1))/sqrt((A(10,1)-q(1,1))^2+(A(10,2)-q(2,1))^2+(A(10,3)-q(3,1))^2))^2)*(Ucz^2);
cz2=(((-A(10,3)-q(3,1))/sqrt((A(10,1)-q(1,1))^2+(A(10,2)-q(2,1))^2+(A(10,3)-q(3,1))^2))^2)*(sig_q(3,1)^2);
nj_pol=sqrt(cx1+cx2+cy1+cy2+cz1+cz2)*1.96;
MNC=[POL_Prum,nj_pol];
%%
fprintf('poloměr určen pomocí MNČ:        %f ± %f',MNC);
fprintf('\npoloměr určen pomocí sférometru: %f ± %f',sfe);