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
L = length(DAQ);
Ts = 1/L;
t = (0:L-1)*Ts;
Fs = L;
%% TRANSFORMADA RÁPIDA DE FOURIER
Y = fft(DAQ);                                                               % FFT
P = abs(Y/L);                                                               % Valor absoluto da FFT    
P1 = P(1:L/2+1);                                                            % Manipulação de Variáveis
P1(:,2:end-1) = 2*P1(:,2:end-1);                                            % Manipulação de Variáveis
freq = length(DAQ)*(0:(L/2))/L;                                             % Vetor frequência
%% OBTENÇÃO DA FASE 
fase0 = angle(Y);                                                           % Cálculo da fase
fase1 = fase0/L;                                                            % Normalização da fase
indice_H1 = ceil((((Fs/2)*400)/(Fs/2)));                                    % Cálculo para encontrar o índice de H1
indice_H2 = indice_H1*2;                                                    % Cálculo para encontrar o índice de H2
%% EXTRAÇÃO DOS VALORES DE AMPLITUDE DOS HARMÔNICOS
H1 = abs(P1(indice_H1+1));                                                  % Primeiro harmônico                                          
H2 = abs(P1(indice_H2));                                                    % Segundo harmônico
H = H1/H2;                                                                  % Relação entre os harmônicos
H1 = round(10*log10(H1),4);                                                 % Conversão para dB de H1         
H2 = round(10*log10(H2),4);                                                 % Conversão para dB de H1
%% VARIÁVEIS EXTERNAS PARA CÁLCULO DO LAMBDA DA LPG
Am = 0.44;                                                                  % Amplitude de modulação
a = 0.01;                                                                   % Largura espectral
d = 3.35;                                                                      % Porcentagem de distoção
Ad = (Am*d)/100;                                                            % Amplitude de distorção 
Lc = 1540;                                                                  % Comprimento de onda da FBG
%% CÁLCULO DOS COEFICIENTES
format long
k12 = -4*Ad.*a.*Am;                                                         % Cálculo dos coeficientes
k11 = -4.*Am+6*a.*Ad.^2.*Am+3*a.*Am.^3;                                     % Cálculo dos coeficientes
k10 = 2*Ad.*Am;                                                             % Cálculo dos coeficientes

k23= -2*a^2*Ad.^3-4*a^2*Ad.*Am.^2;                                          % Cálculo dos coeficientes
k22 = -2*a*Am.^2;                                                           % Cálculo dos coeficientes
k21 = -4*Ad+3*a*Ad.^3+6*a*Ad.*Am.^2;                                        % Cálculo dos coeficientes
k20 = Am.^2 ;                                                               % Cálculo dos coeficientes

A = k22.*H-k12;                                                             % Cálculo dos coeficientes
B = k21.*H-k11;                                                             % Cálculo dos coeficientes
C = k20.*H-k10;                                                             % Cálculo dos coeficientes
%% INTERROGAÇÃO PARA DETERMINAR O COMPRIMENTO DE ONDA DA LPG
% S1 = (-B + sqrt(B^2 - 4*A*C))/(2*A);                                      
% S2 = (-B - sqrt(B^2 - 4*A*C))/(2*A);                                      

S2 = (-B + sqrt(B^2 - 4*A*C))/(2*A);                                        % Raíz dos coeficientes
S1 = (-B - sqrt(B^2 - 4*A*C))/(2*A);                                        % Raíz dos coeficientes

fase = rad2deg(fase1(indice_H2));                                           % Fase do segundo harmônico

L1= round(S1 + Lc,2)                                                       % Comprimento de onda da LPG      
L2= round(S2 + Lc,2)                                                       % Comprimento de onda da LPG

if fase > 0                                                                 % Condicional
    Lr = S1 + Lc;                                                           % Comprimento de onda da LPG
else                                                                        % Condicional
    Lr = S2 + Lc;                                                           % Comprimento de onda da LPG
end                                                                         % Fim da condicional
%% ARMAZENAMENTO DOS VALORES CALCULADOS EM ARQUIVO .MAT
% save('C:\Users\weber\Desktop\Resultados Experimentais\Fase 3\400Hz\Distorção 3.35%\1550nm')
%% DISTORÇÃO HARMÕNICA TOTAL
[th] = thd(DAQ,Fs,2);                                                       % Distorção harmônica total
THD_percent = 100*(10^(th/20));                                             % Porcentagem da THD
%% RELAÇÃO SINAL-RUÍDO
[SNR] = snr(DAQ,Fs,2);                                                      % Relação sinal-ruído  
%% PLOTAGEM GRÁFICA DE DADOS
plot(freq,10*log10(P1))                                                     % Plotagem gráfica
xlim([0 2000])                                                            % Limitação do eixo X
ylim([-50 0])                                                               % Limitação do eixo Y
txt1 = ['\leftarrow H1: ',num2str(H1),' dB'];                               % Strings dinâmica para plotar o valor de H1
txt2 = ['\leftarrow H2: ',num2str(H2),' dB'];                               % Strings dinâmica para plotar o valor de H2
text(indice_H1,H1,txt1,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
text(indice_H2,H2,txt2,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
tit2 = ['Transformada Rápida de Fourier','\color{red}'...                   % Título do gráfico
    ,'          Lr:',num2str(Lr),'nm'];                                     % Título do gráfico
title(tit2)                                                                 % Título do gráfico