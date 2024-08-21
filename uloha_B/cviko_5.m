clc; clear all; format short g

data = importdata('data.csv')
X = data(:,1)
Y = data(:,2)
Z = data(:,3)

%% MNC
% z = a0 +a1x +a2y+a3x^2+a4y^2.... hledam koeficienty a

%tvorba matic pomoci submatic
A = [ones(length(X),1), X, Y, X.^2, Y.^2, X.^3, Y.^3]
% q = inv(A'*A)*A'*Z
q = (A'*A)\(A'*Z) % zbavuju se toho podvlneni, tak udelam inverzi zleva. MUSI TAM BYT ZPETNE LOMITKO
% q3 = A\Z

%% vypocet nejistot
Sig_L = eye(length(Z))
sig_0 = 1

[q, Sig_q] = mnc(A, Z, Sig_L, sig_0)







