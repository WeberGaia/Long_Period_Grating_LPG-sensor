function [B,C,D] = coeff(Am,a,Ad,H)
%COEFICIENTES PARA CÁLCULO DAS RAÍZES
%   Equações utilizadas foram do papper do vicente
k13 = -4*a^2*Ad.^2.*Am-2*a^2*Am.^3; 
k12 = -4*Ad.*a.*Am;                 
k11 = -4.*Am+6*a.*Ad.^2.*Am+3*a.*Am.^3;
k10 = 2*Ad.*Am;

k23= -2*a^2*Ad.^3-4*a^2*Ad.*Am.^2;
k22 = -2*a*Am.^2;
k21 = -4*Ad+3*a*Ad.^3+6*a*Ad.*Am.^2;
k20 = Am.^2 ;

% A = k23.*H-k13;
B = k22.*H-k12;
C = k21.*H-k11;
D = k20.*H-k10;

% s2 = (-C + sqrt(C.^2 - 4*B.*D))./(2*B);
% s1 = (-C - sqrt(C.^2 - 4*B.*D))./(2*B);
end