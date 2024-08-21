function[g,G]=ned_hran(g2,alpha13,delta12,delta23)
alpha12=90+delta12; alpha23=90+delta23;
g1=[1,1,1]; g3=[1,1,1];

g3(1,2)=cosd(alpha23);
g3(1,1)=(cosd(alpha13)-cosd(alpha12)*cosd(alpha23))/sind(alpha12);
g3(1,3)=sqrt(sind(alpha23)^2-g3(1,1)^2);

g1(1,2)=cosd(alpha12); 
g1(1,1)=sind(alpha12);
g1(1,3)=(-(g1(1,1)*g3(1,1))-(g1(1,2)*g3(1,2)))/g3(1,3);

A=g2-g1;
B=g3-g1;
z=norm(cross(A,B));
g=cross(A,B)/z;
% clear z
G=[g1;g2;g3];
end
