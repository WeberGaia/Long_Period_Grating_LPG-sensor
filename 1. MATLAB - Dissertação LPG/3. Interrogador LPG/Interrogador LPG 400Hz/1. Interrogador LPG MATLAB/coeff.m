function [A,B,C] = coeff(Am,a,Ad,H)
%COEFICIENTES PARA CÁLCULO DAS RAÍZES
%   Equações utilizadas foram do papper do vicente
format long
k10 = 2*Ad.*Am;
k11 = -4.*Am + 6*a.*Ad.^2.*Am + 3*a.*Am.^3;
k12 = -4*Ad.*a.*Am; 
k13 = -4*a^2*Ad.^2.*Am - 2*a^2*Am.^3; 
                
k20 = Am.^2;
k21 = -4*Ad + 3*a*Ad.^3 + 6*a*Ad.*Am.^2;
k22 = -2*a*Am.^2;
k23 = -2*a^2*Ad.^3 - 4*a^2*Ad.*Am.^2;

A = k22*H-k12;
B = k21*H-k11;
C = k20*H-k10;
end

