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
%% Informações sobre o DAQ6216 - NI
% d = daqlist;                                                              % Verificando se o DAQ está conectado
% d(1,:)
% d{1, "DeviceInfo"};                                                       % Plotando as informações do dispositivo
%% Algoritmo de comunicação entre o DAQ6216 e o MATLAB
dq = daq("ni");                                                             % Indica as informações como taxa de amostragem e outras propriedades
ch1 = addinput(dq, "Dev1", "ai15", "Voltage");                              % ch = addinput(dq,"channelID", "ai0","Voltage") - Add um canal para a aquisição de dados
ch1.Range = [-1, 1];                                                        % Alterando o Range para -1.0 to 1.0 (sensibilidade)
%% ALTERANDO A FREQUÊNCIA DE AMOSTRAGEM 
Fs = 2400;                                                                  % Freqência de Amostragem
dq.Rate = Fs;                                                               % Alterando a Fs padrão (1000) para 4800sps
%% LEITURA DO SINAL PROVENIENTE DO AWG
[datas,starTime] = read(dq,seconds(1));                                     % Leitura dos valores do sinal
aux1 = timetable2table(datas);                                              % Conversão de tipo de dados
aux1(:,1) = [];                                                             % Excluindo a coluna tempo
aux2 = table2array(aux1);                                                   % Conversão de tipo de dados

plot(datas.Time, datas.Dev1_ai15);                                          % Plot do sinal 
grid on                                                                     % Inserindo grade no gráfico
legend('Sinal Modulado')                                                    % Inserindo legenda
xlabel('Tempo (s)')                                                         % Inserindo nome do eixo X
ylabel('Tensão (V)')                                                        % Inserindo nome do eixo Y
xlim(seconds([0 0.02]))                                                     % Limitando as coordenadas do eixo X