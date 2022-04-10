%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   UNIVERSIDADE FEDERAL FLUMINENSE                       %
%                  LABORATÓRIO DE COMUNICAÇÕES ÓTICAS                     %
%    DESENVOLVIMENTO DE INSTRUMENTO PARA INTERROGAÇÃO DE SENSORES ÓTICOS  %
%               PROF. DR. ANDRÉS PABLO LOPEZ BARBERO                      %
%                    WEBER DE SOUZA GAIA FILHO                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variáveis de Limpeza
clc;
close all
clear all
%% CARREGANDO A AQUISIÇÃO DE DADOS DO DAQ6216
% load 'C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\7. Interrogador LPG\2. 1800Hz\1541nm\Distorção 10%\DAQ6216_1s_10800.mat'
% DAQ = volt1;
% clear volt1

% load 'C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\7. Interrogador LPG\2. 1800Hz\1541nm\Distorção 3%\DAQ6216_2s_10800.mat'
% DAQ = volt2;
% clear volt2

% load 'C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\7. Interrogador LPG\2. 1800Hz\1541nm\Distorção 10%\DAQ6216_1s_14400.mat'
% DAQ = volt3;
% clear volt3

% load 'C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\7. Interrogador LPG\2. 1800Hz\1541nm\Distorção 3%\DAQ6216_2s_14400.mat'
% DAQ = volt4;
% clear volt4

d = 3;
%% 
t = (0:length(DAQ)-1)*(1/length(DAQ));                                      % Vetor para cálculo ddo tempo
Fs = 10800;                                                                 % Frequência de amostragem
Fs = 14400;                                                                 % Frequência de amostragem
[P1,aux_fase,f_plot] = FFT(DAQ,Fs);
%% 
f = 1800;
[index1, index2,aux2_fase] = Fase(f,Fs,aux_fase(1:length(P1)));
%% 10800
% H1 = abs(P1(index1));
% H2 = abs(P1(index2-2));

% H1 = abs(P1(index1-1));
% H2 = abs(P1(index2-4));
%% 14400
% H1 = abs(P1(index1-1));
% H2 = abs(P1(index2-3));

H1 = abs(P1(index1-2));
H2 = abs(P1(index2-6));
%% 
H = H1/H2;
dbH1 = 10*log10(H1);                                                        % Transformação para dB (H1)
dbH2 = 10*log10(H2);                                                        % Transformação para dB (H2)
%% COEFICIENTES PARA OBTENÇÃO DAS RAÍZES
Am = 0.44;                                                                  % Amplitude de modulação
a = 0.01;                                                                   % Largura espectral da LPG
% d = 4;                                                                      % Porcentagem de distorção;
Ad = (Am*d/100);                                                            % Amplitude de distorção;
Lc = 1540;                                                                  % Comprimento de onda LPG
[B,C,D] = coeff(Am,a,Ad,H);
%% OBTENÇÃO DO COMPRIMENTO DE ONDA DA LPG
[Lr] = LambdaR(B,C,D,index2,aux2_fase,Lc);
% [Lr2] = LambdaR2(B,C,D,index2,aux2_fase,Lc);
%% 
[c,percent] = THD(DAQ,Fs);
%% 
SNR = snr(DAQ,Fs,3);
plot(f_plot,10*log10(P1),'k')
title(['FFT para F_s: ',num2str(Fs),'sps c/ distorção de ',num2str(d),'%'])
subtitle(['H1: ',num2str(dbH1),'(dB)         H2: ',num2str(dbH2),'(dB)      ','Lr: ',num2str(Lr),'nm'])
grid on 
grid minor