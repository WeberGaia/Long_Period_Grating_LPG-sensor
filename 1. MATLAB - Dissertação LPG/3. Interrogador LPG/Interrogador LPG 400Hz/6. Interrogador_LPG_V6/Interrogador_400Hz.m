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
%% 
load('C:\Users\weber\Desktop\Arquivos MAT\Ciclo 300\teste','DAQ')
% DAQ = DAQ(1:32400);
L = length(DAQ);
Ts = 1/L;
t = (0:L-1)*Ts;
Fs = L;
% plot(t,DAQ)
% xlim([0 0.01])
%% 
Y = fft(DAQ);
P = abs(Y/L);                                                               
P1 = P(1:L/2+1);                                                            
P1(:,2:end-1) = 2*P1(:,2:end-1);
freq = length(DAQ)*(0:(L/2))/L;
%% 
fase0 = angle(Y);                                                           % Cálculo da fase
fase1 = fase0/L;                                                            % Normalização da fase
indice_H1 = ceil((((Fs/2)*400)/(Fs/2)));                                    % Cálculo para encontrar o índice de H1
indice_H2 = indice_H1*2; 
%% 
H1 = abs(P1(indice_H1+1));                                                  % Ciclo 60                                          
H2 = abs(P1(indice_H2+1));                                                  % Ciclo 60
H = H1/H2;                                                                  
H1 = round(10*log10(H1),4);                                                          
H2 = round(10*log10(H2),4);  
% H = H1-H2;
%% 
Am = 0.44;                                                                  % Amplitude de modulação
a = 0.01;                                                                   % Largura espectral
d = 1;                                                                      % Porcentagem de distoção
Ad = (Am*d)/100;                                                            % Amplitude de distorção 
Lc = 1540;            
%% 
k12 = -4*Ad.*a.*Am;                                                         % Cálculo dos coeficientes
k11 = -4.*Am+6*a.*Ad.^2.*Am+3*a.*Am.^3;                                     % Cálculo dos coeficientes
k10 = 2*Ad.*Am;                                                             % Cálculo dos coeficientes

k23= -2*a^2*Ad.^3-4*a^2*Ad.*Am.^2;                                          % Cálculo dos coeficientes
k22 = -2*a*Am.^2;                                                           % Cálculo dos coeficientes
k21 = -4*Ad+3*a*Ad.^3+6*a*Ad.*Am.^2;                                        % Cálculo dos coeficientes
k20 = Am.^2 ;                                                               % Cálculo dos coeficientes

A = k22.*H-k12;                                                             % Cálculo dos coeficientes
B = k21.*H-k11;                                                             % Cálculo dos coeficientes
C = k20.*H-k10;  
%% 
% S1 = (-B + sqrt(B^2 - 4*A*C))/(2*A);                                      
% S2 = (-B - sqrt(B^2 - 4*A*C))/(2*A);                                      
          
S2 = (-B + sqrt(B^2 - 4*A*C))/(2*A);                                      
S1 = (-B - sqrt(B^2 - 4*A*C))/(2*A);

fase = rad2deg(fase1(indice_H2));

L1= round(S1 + Lc,2);                                                             
L2= round(S2 + Lc,2);

if fase > 0                                                                 
    Lr = S1 + Lc;
else
    Lr = S2 + Lc;
end
% save('C:\Users\weber\Desktop\Resultados Experimentais\Fase 3\1800Hz\Distorção 3.35% Ciclo 60\1553nm')
%% 
[th] = thd(DAQ,Fs,2);
THD_percent = 100*(10^(th/20));
[SNR] = snr(DAQ,Fs,2);
%% 
plot(freq,10*log10(P1))
% xlim([0 5000])
ylim([-60 0])
txt1 = ['\leftarrow H1: ',num2str(H1),' dB'];                              % Strings dinâmica para plotar o valor de H1
txt2 = ['\leftarrow H2: ',num2str(H2),' dB'];                              % Strings dinâmica para plotar o valor de H2
text(indice_H1,H1,txt1,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
text(indice_H2,H2,txt2,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
tit2 = ['Transformada Rápida de Fourier','\color{red}','          Lr:',num2str(Lr),'nm'];
title(tit2)