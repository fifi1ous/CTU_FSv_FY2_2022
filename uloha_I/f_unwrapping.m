function UP = f_unwrapping( WP )
% Itohuv algoritmus unwrappingu pro plnou matici dat. Vyhodnocuje od leveho
% horniho rohu matice. Nejprve vyhodnoceny radky, posleze prvni sloupec a
% jeho hodnoty pricteny k radkum. Pro spravne vyhodnoceni musi byt od
% leveho horniho rohu relevantni data
%
% Autor: Petr Pokorny, 2014
% Revize: Petr Pokorny, 2020

[M, N] = size(WP);   % rozmer dat

UP = zeros(M,N);    % alokace vyslednych dat

% vyhodnoceni radku
for i=1:M
    for j=2:N
        UP(i,j) = UP(i,j-1) + fcnW(fcnD(WP(i,j-1:j)));
    end
end

% vyhodnoceni sloupce, pricteni k radkum
C = zeros(M,1);
for i=2:M
   C(i,:) = C(i-1,:) + fcnW(fcnD(WP(i-1:i,1)));
   UP(i,:) = UP(i,:) + C(i);
end

end

function WX = fcnW(X)
% Wrapp operator pomoci zaokrouhleni po deleni
WX = X - 2*pi*round(X/2/pi);
end

% function WX = fcnW(X)
% % Wrapp operator pomoci funkce arctan
% WX = atan2(sin(X),cos(X));
% end

function DX = fcnD(X)
% Operator diference
DX = X(2)-X(1);
end