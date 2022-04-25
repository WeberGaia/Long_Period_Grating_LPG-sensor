%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   UNIVERSIDADE FEDERAL FLUMINENSE                       %
%                  LABORATÓRIO DE COMUNICAÇÕES ÓTICAS                     %
%    DESENVOLVIMENTO DE INSTRUMENTO PARA INTERROGAÇÃO DE SENSORES ÓTICOS  %
%               PROF. DR. ANDRÉS PABLO LOPEZ BARBERO                      %
%                    WEBER DE SOUZA GAIA FILHO                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Variáveis de Limpeza
clc
close all
clear all
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
Fs = 14400;                                                                 % Freqência de Amostragem
% Fs = 7200;                                                                  % Freqência de Amostragem
% Fs = 2400;                                                                  % Freqência de Amostragem
dq.Rate = Fs;                                                               % Alterando a Fs padrão (1000) para 2400sps
%% LEITURA DO SINAL PROVENIENTE DO AWG
[datas] = read(dq,seconds(1));                                              % Leitura dos valores do sinal
aux1 = timetable2table(datas);                                              % Conversão de tipo de dados
aux1(:,1) = [];                                                             % Excluindo a coluna tempo
aux2 = table2array(aux1);                                                   % Conversão de tipo de dados
%% VARIÁVEIS DE PARAMETRIZAÇÃO
DAQ = aux2;                                                                 % Alteração do nome da variável principal
clear aux2                                                                  % Exclusão da variável aux2
L = length(DAQ(1:Fs));                                                            % Tamanho da variável do sinal
%% TRANSFORMADA RÁPIDA DE FOURIER
Y = fft(DAQ);                                                               % Transformada Rápida de Fourier
P = abs(Y/L);                                                               % Normalização dos valores absolutos da FFT
P1 = P(1:L/2+1);                                                            % Manipulação de dados
P1(:,2:end-1) = 2*P1(:,2:end-1);                                            % Manipulação de dados
freq = length(DAQ)*(0:(L/2))/L;                                             % Vetor Frequência 
%% FASE
fase0 = angle(Y);                                                           % Cálculo da fase
fase1 = fase0/L;                                                            % Normalização da fase
indice_H1 = ceil((((Fs/2)*400)/(Fs/2)));                                    % Cálculo para encontrar o índice de H1
indice_H2 = indice_H1*2;                                                    % Cálculo para encontrar o índice de H2
%% CÁLCULO DE H
H1 = abs(P1(indice_H1+1));                                                    % Primeiro Harmônico
H2 = abs(P1(indice_H2+1));                                                    % Segundo Harmônico
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
L1= S1 + Lc;                                                                % Verificação do valor de cada raíz
L2= S2 + Lc;                                                                % Verificação do valor de cada raíz
fase = rad2deg(fase1(indice_H2));                                           % Fase do segundo harmônico

if fase > 0                                                                 % Condição para a determinação de Lr
    Lr = S1 + Lc;
else
    Lr = S2  + Lc;
end
%% DISTORÇÃO HARMÔNICA TOTAL
[th] = thd(DAQ,Fs,2);                                                       % Cálculo da THD
THD_percent = 100*(10^(th/20));                                             % Cálculo da porcentagem da THD
%% RELAÇÃO SINAL-RUÍDO
[SNR] = snr(DAQ,Fs,2);                                                      % Relação sinal-ruído
toc
%% PLOTAGEM GRÁFICA 
% fh1 = figure(1);                                                            % Figura 
% fh1.WindowState = 'maximized';                                              % Maximização da tela da figura
% % subplot(2,2,1)
% plot(datas.Time, datas.Dev1_ai15,'k');                                      % Plot do sinal 
% tit = ['Sinal demodulado da LPG c/ ','\color{blue}',num2str(Fs),'sps'];     % Strings dinâmica    
% title(tit,'FontWeight','bold')                                              % Função para plotar título
% grid on                                                                     % Inserindo grade no gráfico
% legend('Sinal Modulado')                                                    % Inserindo legenda
% xlabel('Tempo (ms)')                                                        % Inserindo nome do eixo X
% ylabel('Tensão (V)')                                                        % Inserindo nome do eixo Y
% xlim(seconds([0 0.02]))                                                     % Limitando as coordenadas do eixo X

% subplot(2,2,2)
fh2 = figure(2);                                                            % Figura
fh2.WindowState = 'maximized';                                              % Maximização da tela da figura
plot(freq,10*log10(P1),'b')                                                 % Plot do sinal
sub = ['Lr: ','\color{blue}',num2str(Lr),'nm        ','\color{red}','Fs: ',num2str(Fs)];                             % Strings dinâmica
% Lr2 = [1536,1537,1538,1539,1540,1541,1542,1543,1544,1545,1546,1547];
tit = ['Interrogador LPG para ',num2str(1545),'nm c/ distorção de ',num2str(d),'%'];
% save('C:\Users\weber\Desktop\Resultados Experimentais\Taxa de amostragem - 14400sps\Distorção 0%\DAQ_1545nm')
title(tit)                                                                  % Função para plotar título
subtitle(sub,'FontWeight','bold')                                           % Função para plotar sub-titulo    
txt1 = [' \leftarrow H1: ',num2str(H1),' dB'];                              % Strings dinâmica para plotar o valor de H1
txt2 = [' \leftarrow H2: ',num2str(H2),' dB'];                              % Strings dinâmica para plotar o valor de H2
text(indice_H1,H1,txt1,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
text(indice_H2,H2,txt2,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
grid on                                                                     % Grade gráfica
grid minor                                                                  % Grade gráfica
xlabel('Frequência(Hz)')
ylabel('Magnitude(dB)')
xlim([0 1200*2])
format long
L1
L2
% figure(3)
% % subplot(2,2,3)
% snr(DAQ,Fs,2);

% figure(4)
% % subplot(2,2,4)
% thd(DAQ,Fs,2);
%% SALVAR A AQUISIÇÃO DE DADOS EM UM LOCAL ESPECÍFICO
% save('C:\Users\weber\Desktop\Resultados Experimentais\Distorção 12%\DAQ_1555nm')
%% OBSERVAÇÕES
% Este código lê a simulação de um sinal demodulado da LPG através de um
% arquivo CSV, onde é configurado a quantidade de ciclos para melhor
% amostrar o sinal. Está sendo fixado um número inteiro de doze ciclos para
% melhorar a relação sinal ruído e melhor amostrar o sinal (Verificar os
% cálculos no arquivo em Excel e no Wolfram). 