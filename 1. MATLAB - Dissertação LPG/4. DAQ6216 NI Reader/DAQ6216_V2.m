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
%% Informações sobre o DAQ6216 - NI
% d = daqlist;                                                              % Verificando se o DAQ está conectado
% d(1,:)                                                                    % Plotando as informações do dispositivo
% d{1, "DeviceInfo"};                                                       % Plotando as informações do dispositivo
tic
%% Algoritmo de comunicação entre o DAQ6216 e o MATLAB
dq = daq("ni");                                                             % Indica as informações como taxa de amostragem e outras propriedades
ch1 = addinput(dq, "Dev1", "ai15", "Voltage");                              % ch = addinput(dq,"channelID", "ai0","Voltage") - Add um canal para a aquisição de dados
ch1.Range = [-1, 1];                                                        % Alterando o Range para -1.0 to 1.0 (sensibilidade)
%% ALTERANDO A FREQUÊNCIA DE AMOSTRAGEM 
% Fs = 32400;                                                               % Freqência de Amostragem
Fs = 7200;
dq.Rate = Fs;                                                               % Alterando a Fs padrão (1000) para 2400sps
%% LEITURA DO SINAL PROVENIENTE DO AWG
[datas] = read(dq,seconds(1));                                              % Leitura dos valores do sinal
aux1 = timetable2table(datas);                                              % Conversão de tipo de dados
aux1(:,1) = [];                                                             % Excluindo a coluna tempo
aux2 = table2array(aux1);                           
DAQ = aux2;
%% TRANSFORMADA RÁPIDA DE FOURIER
L = length(DAQ);
Y = fft(DAQ);                                                               % Transformada Rápida de Fourier
P = abs(Y/L);                                                               % Normalização dos valores absolutos da FFT
P1 = P(1:L/2+1);                                                            % Manipulação de dados
P1(:,2:end-1) = 2*P1(:,2:end-1);                                            % Manipulação de dados
freq = length(DAQ)*(0:(L/2))/L;  
%% 
% fh1 = figure(1);
% fh1.WindowState = 'maximized';                                            % Maximização da tela da figura
figure(1)                                                                   % 
subplot(2,1,1)                                                              % 
plot(datas.Time, datas.Dev1_ai15,'k');                                      % Plot do sinal
xlim(seconds([0 0.05]))                                                     % Limitando as coordenadas do eixo X

subplot(2,1,2)                                                              
plot(freq,10*log10(P1),'b')
save('C:\Users\weber\Desktop\Arquivos MAT\Ciclo 300\teste','DAQ')
toc