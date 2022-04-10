%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   UNIVERSIDADE FEDERAL FLUMINENSE                       %         
%   PROGRAMA DE PÓS-GRADUAÇÃO EM ENGENHARIA ELÉTRICA E TELECOMUNICAÇÕES   %
%           ORIENTADOR: PROF. DR. ANDRÉS PABLO LOPEZ BARBERO              %
%                     WEBER DE SOUZA GAIA FILHO                           %
%                   TÉCNICAS DE INTERROGAÇÃO DE LPG                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% VARIÁVEIS DE LIMPEZA
clear all
close all
clc
%% CÁLCULO DE H1 E H2 PARA CADA VALOR DE S
P0 = 0.31257;                                                                       % Potência da fonte ótica
a = 0.008;                                                                           % Largura Espectral da LPG
m = 0.84;                                                                           % Amplitude Normalizada
d = 11;                                                                             % Percentual de distorção
Am = 0.44;                                                                          % Amplitude de Modulação 
Ad=(Am*d)/100;                                                                      % Distorção no modulador
Lc = 1540;
Lr = 1520:0.01:1560;
S = Lr-Lc;
i = 1;
for i = 1:length(S)
    for j = 1:length(d)
H1(i,j) = (1/2)*a*Am*exp(-a*S(i)^2)*m*P0.*(Ad.*(2-4*a*S(i)^2)-2*a*Ad^2*S(i)*...
    (-3+2*a*S(i)^2)-S(i)*(4-3*a*Am^2+2*a^2*Am^2*S(i)^2));

H2(i,j) = 1/2*a*exp(-a*S(i)^2)*m*P0*(-Ad*S(i)*(4-3*a*Ad^2+2*a^2*...
    Ad^2*S(i)^2)+Am^2*(1+2*a*(3*Ad-S(i))*S(i)-4*a^2*Ad*S(i)^3));
    end
end

H = (H1./H2);