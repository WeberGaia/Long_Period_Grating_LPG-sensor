function [P1,L,fase,f_plot] = FFT(DAQ,Fs)
% TRANSFORMADA RÁPIDA DE FOURIER
%   Detailed explanation goes here
Y = fft(DAQ);                                                               % Transformada Rápida de Fourier
fase = angle(Y);                                                            % Fase do sinal
L = length(DAQ);                                                            % Comprimento do sinal
P2 = abs(Y/L);                                                              % Normalização dos dados
P1 = P2(1:L/2+1);                                                           % Seleção dos dados para cálculos
P1(:,2:end-1) = 2*P1(:,2:end-1);                                            % Manipulação de dados
f_plot = Fs*(0:(L/2))/L;                                                    % Eixo das frequências
end

