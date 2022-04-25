function [Lr] = LambdaR2(A,B,C,index2,aux_fase,Lc)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
% aux1 = B;
% aux2 = sqrt(B^2 - 4*A*C);
% aux3 = 2*A;
% S1 = (-aux1 + aux2)/aux3;
% S2 = (-aux1 - aux2)/aux3;
S1 = (-B + sqrt(B^2 - 4*A*C))/2*A;
S2 = (-B - sqrt(B^2 - 4*A*C))/2*A;
% fase = rad2deg(fase_aux(indice2));
fase = rad2deg(aux_fase(index2));

if fase > 0
    Lr = S1 + Lc;
else 
    Lr = S2 + Lc;
end
end
