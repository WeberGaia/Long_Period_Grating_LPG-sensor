function [c,percent] = THD(LPG,Fs)
% Distorção Harmônica Total
%   Detailed explanation goes here
[c] = thd(LPG,Fs,'aliased');
percent = (10^(c/20))*100;
end