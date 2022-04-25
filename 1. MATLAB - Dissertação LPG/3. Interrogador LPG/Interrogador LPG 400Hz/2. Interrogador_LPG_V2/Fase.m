function [aux5,aux6,aux2] = Fase(f,Fs,ph)
%UNTITLED3 Summary of this function goes here
L = length(ph);
aux1 = angle(ph);       %Fase
aux2 = aux1/L;
% aux3 = aux2(1:L/2+1);
aux4 = length(ph);
aux5 = ceil(((aux4*f)/(Fs/2)));
aux6 = aux5*2;
end