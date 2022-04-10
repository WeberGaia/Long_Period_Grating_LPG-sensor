function [H1,DC,H2,H3,H] = AM(S,Am) 
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
P0 = 0.31257;                                                               % Potência Ótica da fonte
a = 0.01;                                                                   % Largura da gaussiana da função de transferência
m = 0.84;   
d = 0;
Ad=(Am*d)/100; 

DC = P0 + 1/2.*exp(-a.*S.^2).*m.*P0.*(-2+a.*(Ad.^2+Am.^2)-2.*a.^3.*Ad.*Am.^2.*S.^3+...
    a.^2.*S.*(3.*Ad.*Am.^2-2.*Ad.^2.*S-2.*Am.^2.*S));

H1 = 1/2.*a.*Am.*exp(-a.*S.^2).*m.*P0.*(Ad.*(2-4.*a.*S.^2)-2.*a.*Ad.^2.*S.*...
    (-3+2.*a.*S.^2)-S.*(4-3.*a.*Am.^2+2.*a.^2.*Am.^2.*S.^2));

H2 = 1/2.*a.*exp(-a.*S.^2).*m.*P0.*(-Ad.*S.*(4-3.*a.*Ad.^2+2.*a.^2.*...
    Ad.^2.*S.^2)+Am.^2.*(1+2.*a.*(3.*Ad-S).*S-4.*a.^2.*Ad.*S.^3));

H3 = 1/6.*a.*Am.*exp(-a.*S.^2).*m.*P0.*(-3.*a.*Ad.^2.*S.*(-3+2.*a.*S.^2)...
    -a.*Am.^2.*S.*(-3+2.*a.*S.^2)-6.*Ad.*(-1+2.*a.*S.^2));

H1 = 10*log10(H1);
H2 = 10*log10(H2);
H3 = 10*log10(H3);
H = H1-H2;
% Devemos considerar, inicialmente, a distorção igual a 0%. Depois
% consideraremos uma distorção de 10%.*
end

