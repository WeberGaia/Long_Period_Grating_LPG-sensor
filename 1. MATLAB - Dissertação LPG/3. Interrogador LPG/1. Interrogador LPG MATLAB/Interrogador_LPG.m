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
%% CARREGANDO OS DADOS OBTIDOS NO DAQ 6216
load DAQ6216_2s_7200.mat -mat                                               % Carregando os dados obtidos ente AWG + DAQ (7200sps e 1s)
DAQ = volt2;                                                                 % Renomeando a variável carregada
clear volt2                                                                  % Removendo a variável inicial de valores
t = (0:length(DAQ)-1)*(1/length(DAQ));
%% TRANSFORMADA RÁPIDA DE FOURIER
Fs = 7200;                                                                  % Frequência de Amostragem
[fft_daq,L,aux_fase,f_plot] = FFT(DAQ,Fs);                                  % Função para cálculo da FFT
%% ENCONTRANDO OS VALORES DAS AMPLITUDES DOS HARMÔNICOS
f = 399.9;                                                                  % Frequência de modulação
[indice1,indice2,fase_aux] = Fase(aux_fase(1:length(fft_daq)),f,Fs);        % Função para calcular a fase e retornar os índices dos harmônicos
H1 = abs(fft_daq(indice1));                                                 % Obtenção da amplitude do primeiro harmônico
H2 = abs(fft_daq(indice2-2));                                               % Obtenção da amplitude do segundo harmônico
H = H1/H2;                                                                  % Relação entre os harmônicos
dbH1 = 10*log10(H1);                                                        % Transformação para dB (H1)
dbH2 = 10*log10(H2);                                                        % Transformação para dB (H2)
% H = dbH1-dbH2;                                                            % Relação entre os harmônicos
%% DISTORÇÃO HARMÔNICA TOTAL
[thd,percent] = THD(DAQ,Fs);                                                % Distorção Harmônica Total
%% COEFICIENTES PARA OBTENÇÃO DAS RAÍZES
Am = 0.44;                                                                  % Amplitude de modulação
a = 0.01;                                                                   % Largura espectral da LPG
Ad = 10;                                                                    % Porcentagem de distorção 
lambda = 1540;                                                              % Comprimento de onda LPG
[A,B,C] = coeff(Am,a,Ad,H);                                                 % Função para calcular os coeficientes
%% OBTENÇÃO DO COMPRIMENTO DE ONDA DA LPG
[Lr] = LambdaR(A,B,C,indice2,fase_aux,lambda);
%% PLOTAGEM GRÁFICA DOS RESULTADOS
subplot(2,2,1)
plot(t,DAQ,'k')
xlabel('Tempo (ms)')
ylabel('Amplitude (mV)')
grid on
xlim([0 0.02])

subplot(2,2,2)
plot(f_plot,10*log10(fft_daq),'k')
% title('Transformada Rápida de Fourier (Logarítmo)')
xlabel('Frequência (Hz)')
ylabel('Amplitude (dB)')
grid on
legend('FFT (dB)')

subplot(2,2,3)
clear thd
thd(DAQ,Fs,3);
ylim([-120 0])

subplot(2,2,4)
snr(DAQ,Fs,3);
ylim([-135 0])