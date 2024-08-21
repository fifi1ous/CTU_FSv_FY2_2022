function [Z]=soz(A,C,R)
%výpočet souřadnice výšky bodu, pomocí kvadratické rovnice
%vstup:
%   A-souřadnice X,Y
%   C-střed soustavy
%   R-vzdálenost boů od středu
%výstup:
%   Z-Souřadnice Z

r=length(A);
Z=ones(r,1);
for i=1:r
    Q=R^2-(A(i,1)-C(1,1))^2-(A(i,2)-C(2,1))^2-C(3,1)^2;
    D=(2*C(3,1))^2-4*1*Q;
    Z(i,1)=-(-(2*C(3,1))+sqrt(D))/2;
    Z(i,1)=-(-(2*C(3,1))-sqrt(D))/2*(-1);
end
end