function[s1]=kout_odraz_mat(s0,n,g,g1)
s=1/n*s0-(sqrt(1-(1/n).^2*(1-(s0.*g).^2))+1/n*s0.*g).*g;
Ignac=3;
 for riadok=1:Ignac
     s=s-2*(s.*g1(riadok,:)).*g1(riadok,:);
 end
s1=n*s+(sqrt(1-n^2.*(1-(s.*g).^2))-n*s.*g).*g;
clear Ignac; clear riadok;
end
