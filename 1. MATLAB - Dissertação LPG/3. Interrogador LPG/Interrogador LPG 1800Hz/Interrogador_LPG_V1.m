%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   UNIVERSIDADE FEDERAL FLUMINENSE                       %
%                  LABORATÓRIO DE COMUNICAÇÕES ÓTICAS                     %
%    DESENVOLVIMENTO DE INSTRUMENTO PARA INTERROGAÇÃO DE SENSORES ÓTICOS  %
%               PROF. DR. ANDRÉS PABLO LOPEZ BARBERO                      %
%                    WEBER DE SOUZA GAIA FILHO                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variáveis de Limpeza
clear all
close all
clc
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
Fs = 32400;                                                                 % Freqência de Amostragem
dq.Rate = Fs;                                                               % Alterando a Fs padrão (1000) para 2400sps
%% LEITURA DO SINAL PROVENIENTE DO AWG
[datas] = read(dq,seconds(1));                                              % Leitura dos valores do sinal
aux1 = timetable2table(datas);                                              % Conversão de tipo de dados
aux1(:,1) = [];                                                             % Excluindo a coluna tempo
aux2 = table2array(aux1);                           
DAQ = aux2;
clear aux2
%% TRANSFORMADA RÁPIDA DE FOURIER
L = length(DAQ);
Y = fft(DAQ);                                                               % Transformada Rápida de Fourier
P = abs(Y/L);                                                               % Normalização dos valores absolutos da FFT
P1 = P(1:L/2+1);                                                            % Manipulação de dados
P1(:,2:end-1) = 2*P1(:,2:end-1);                                            % Manipulação de dados
% freq = length(DAQ)*(0:(L/2))/L/2;                                         % Vetor Frequência 2s
freq = length(DAQ)*(0:(L/2))/L;                                             % Vetor Frequência 1s
%% FASE
fase0 = angle(Y);                                                           % Cálculo da fase
fase1 = fase0/L;                                                            % Normalização da fase
indice_H1 = ceil((((Fs/2)*1800)/(Fs/2)));                                   % Cálculo para encontrar o índice de H1
indice_H2 = indice_H1*2;                                                    % Cálculo para encontrar o índice de H2
%% CÁLCULO DE H
H1 = abs(P1(indice_H1+1));                                                  % Primeiro Harmônico
H2 = abs(P1(indice_H2+1));                                                  % Segundo Harmônico
% H1 = abs(P1(indice_H1));                                                    % Primeiro Harmônico
% H2 = abs(P1(indice_H2-1));                                                  % Segundo Harmônico
H = H1/H2;                                                                  % Relação entre os harmônicos
H1 = 10*log10(H1);                                                          % Arredondamento para duas casas decimais de H1
H2 = 10*log10(H2);                                                          % Arredondamento para duas casas decimais de H2
%% PARÂMTROS EXTERNOS PASSADOS AO PROGRAMA 
Am = 0.44;                                                                  % Amplitude de modulação
a = 0.01;                                                                   % Largura espectral
d = 0;                                                                      % Porcentagem de distoção
Ad = (Am*d)/100;                                                            % Amplitude de distorção 
Lc = 1540;                                                                  % Comprimento de onda FBG
%% CÁLCULO DOS COEFICIENTES
k13 = -4*a^2*Ad.^2.*Am-2*a^2*Am.^3;                                         % Cálculo dos coeficientes
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
%% DETERMINAÇÃO DO LAMBDA R
S2 = (-B + sqrt(B.^2 - 4*A.*C))/(2*A);                                      % Cálculo das raízes
S1 = (-B - sqrt(B.^2 - 4*A.*C))/(2*A);                                      % Cálculo das raízes
                                                                            % Verificação do valor de cada raíz
fase = rad2deg(fase1(indice_H2));                                           % Fase do segundo harmônico

if fase > 0                                                                 % Condição para a determinação de Lr
    Lr = round(S1 + Lc,2);
else
    Lr = round(S2  + Lc,2);
end
%% 
fh1 = figure(1);                                                            % Figura 
fh1.WindowState = 'maximized';                                              % Maximização da tela da figura
subplot(2,2,1)
plot(datas.Time, datas.Dev1_ai15,'k');                                      % Plot do sinal 
legend('Sinal Demodulado')                                                  % Inserindo legenda
xlabel('Tempo (ms)')                                                        % Inserindo nome do eixo X
ylabel('Tensão (V)')                                                        % Inserindo nome do eixo Y
tit = ['Sinal demodulado da LPG c/ ','\color{red}',num2str(Fs),'sps'];      % Strings dinâmica    
title(tit,'FontWeight','bold')                                              % Função para plotar título
grid on                                                                     % Inserindo grade no gráfico
xlim(seconds([0 0.01]))                                                     % Limitando as coordenadas do eixo X

subplot(2,2,2)
plot(freq,10*log10(P1),'b')
ylabel('Amplitude(dB)')
xlabel('Frequência (Hz)')
grid on
grid minor
tit2 = ['Transformada Rápida de Fourier','\color{red}','          Lr:',num2str(Lr),'nm'];
title(tit2)
% txt1 = [' \leftarrow H1: ',num2str(H1),' dB'];                              % Strings dinâmica para plotar o valor de H1
% txt2 = [' \leftarrow H2: ',num2str(H2),' dB'];                              % Strings dinâmica para plotar o valor de H2
% text(indice_H1,H1,txt1,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
% text(indice_H2,H2,txt2,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
xlim([0 10000])

subplot(2,2,3)
snr(DAQ,Fs,3);
ylim([-150 0])

subplot(2,2,4)
thd(DAQ,Fs,3);
%% 
[SNR] = snr(DAQ,Fs,3);
[th] = thd(DAQ,Fs,3);
THD_percent = 100*(10^(th/20));
%% SALVANDO O ARQUIVO EM DIRETÓRIO ESPECÍFICO
% save('C:\Users\weber\Desktop\Resultados Experimentais\1800Hz\Taxa de amostragem - 32400sps\Distorção 12%\DAQ_1536nm')

format long
L1= S1 + Lc                                                                % Verificação do valor de cada raíz
L2= S2 + Lc  
toc