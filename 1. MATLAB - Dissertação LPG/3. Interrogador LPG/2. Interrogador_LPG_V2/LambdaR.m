function [Lr,L1,L2] = LambdaR(B,C,D,index2,aux_fase,Lc)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% S1 = (-B + sqrt(B^2 - 4*A*C))/2*A;
% S2 = (-B - sqrt(B^2 - 4*A*C))/2*A;

S2 = (-C + sqrt(C.^2 - 4*B.*D))./(2*B);
S1 = (-C - sqrt(C.^2 - 4*B.*D))./(2*B);

 L1= S1 + Lc;
 L2= S2 + Lc;
 
fase = rad2deg(aux_fase(index2));

if fase > 0
    Lr = S2 + Lc;
else 
    Lr = S1 + Lc;
end
end

