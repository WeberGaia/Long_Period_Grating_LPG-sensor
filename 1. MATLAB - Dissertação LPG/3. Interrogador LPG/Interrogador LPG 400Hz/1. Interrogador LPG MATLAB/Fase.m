function [aux5,aux6,aux3] = Fase(ph,f,Fs)
%UNTITLED3 Summary of this function goes here
L = length(ph);
aux1 = ph;
aux2 = aux1/L;
aux3 = aux2(1:L/2+1);
aux4 = length(ph);
aux5 = ceil(((aux4*f)/(Fs/2)));
aux6 = aux5*2;
end

