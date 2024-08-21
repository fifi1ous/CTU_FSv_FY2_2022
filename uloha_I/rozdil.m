function [A1]=rozdil(A)
%rodíl všech souřadnic mezi sebou
%vstup:
%   A-matice souřadnic
%výstup:
%   A1-rozdíl všech souřadnic se všemi
[r s]=size(A);
for n=1:s
    for m=1:r
        if m~=r
        for o=2:r
            A1(m,n)=A(m,n)-A(o,n);
        end
        end
    end
end