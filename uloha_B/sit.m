function [A,X,Y]=sit(P,M,D)
%generování rovnoměrné sítě
%vstup:
%   P-počáteční bod od kterého začíná soustava
%   M-maximální hodnota na soustavě
%   D-interval dělení intenzity sítě
%výstup:
%   A-kombianace souřadnic X,Y
%   X-čtvercová síť souřadnice x
%   Y-čtvercová síť souřadnice y 

E=D+1; S=E^2;
Q=linspace(P,M,E);
for k=1:E
    for j=1:E
        Y(k,j)=Q(1,j)*1;
    end
end        
X=sortrows(Y',"descend");

A=[reshape(X,S,1),reshape(Y,S,1)];
end