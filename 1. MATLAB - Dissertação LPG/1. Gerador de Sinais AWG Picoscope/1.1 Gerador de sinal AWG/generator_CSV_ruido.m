function [banda,lbds,Lr] = generator_CSV_ruido(Lr)
%UNTITLED Summary of this function goes here
%% MODULADOR FBG
Fs = 100000;                                                                % Frequência de Amostragem (Fs:100k)
f = 1800;                                                                   % Frequência de modulação
L = 11999;                                                                  % Comprimento do canal
Ts = 1/(60*L);                                                              % Período de Amostragem
t = (0:L-1)*Ts;                                                             % Vetor tempo
W0 = 2*pi*f*t;                                                              % Frequência Angular
Lc = 1540;                                                                  % Comprimento de Onda da FBG (nm)
Am = 0.44;                                                                  % Amplitude de Modulação
d = 3.35;                                                                      % Percentual de distorção
Ad = (Am*d)/100;                                                            % Amplitude de distorção do modulador
Mod_FBG = Lc + Am*cos(W0) + Ad*cos(2*W0);                                   % Sinal modulado da FBG 
%% CARACTERIZAÇÃO DA LPG
P0 = 0.31257;                                                               % Potência da fonte ótica
a = 0.01;                                                                   % Largura de banda da banda de atenuação da LPG
m = 0.84;                                                                   % Amplitude Normalizada
lbds = 1500:0.01:1580;                                                      % Variação de lambdas (S)
amp_noise = 0.001;                                                          % Porcentagem do ruído
ruido = randn(size(t))*amp_noise*P0;                                        % Ruído
banda = P0*(1-m*exp(-a*(Lr-lbds).^2));                                      % Banda de atenuação da LPG
%% SINAL DEMODULADO DA LPG
signal_dem = P0*(1-m*exp(-a*(Lr-Mod_FBG).^2))+ruido;
% norm = signal_dem;
%% REMOVENDO O NIVEL DC
vetor_sum = sum(signal_dem);
level_DC = vetor_sum/length(signal_dem);
DC = signal_dem - level_DC;
%% NORMALIZAÇÃO DO SINAL DEMODULADO DA LPG
norm = (DC/max(abs(DC))*0.8);
%% GRAVAÇÃO EM ARQUIVO CSV DOS VALORES CALCULADOS PARA O LAMBDA DE 1555nm
if length(norm) == L && Lr == 1555
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1555nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1554
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1554nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif (length(norm) == L && Lr == 1553)
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1553nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1552
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1552nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1551
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1551nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1550
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1550nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1549
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1549nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1548
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1548nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1547
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1547nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1546
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1546nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1545
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1545nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1544
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1544nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1543
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1543nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1542
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1542nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1541
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1541nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1540
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1540nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1539
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1539nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1538
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1538nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1537
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1537nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1536
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1536nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1535
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1535nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1534
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1534nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1533
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1533nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1532
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1532nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1531
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1531nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1530
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\3. CSV ruido\1530nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
    disp('Fim da Gravação...')
end
end
%% CONFIGURAÇÕES PARA 1800Hz DAQ6216
% L = 11999;                                                                  % Comprimento do canal
% Ts = 1/(60*L);                                                              % Período de Amostragem
%% CONFIGURAÇÕES PARA 400Hz DAQ6216
% f = 400;
% L = 7999;                                                                  % Comprimento do canal
% Ts = 1/(40*L);                                                             % Período de Amostragem
