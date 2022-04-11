function [banda,lbds,Lr] = generator_CSV_lbds(Lr)
%UNTITLED Summary of this function goes here
%% MODULADOR FBG
Fs = 100000;                                                                % Frequência de Amostragem
f = 400;                                                                    % Frequência de Modulação
L = 29999;                                                                  % Comprimento do canal
Ts = 1/(20*L);                                                              % Período de Amostragem
t = (0:L-1)*Ts;                                                             % Vetor tempo
W0 = 2*pi*f*t;                                                              % Frequência Angular
Lc = 1540;                                                                  % Comprimento de Onda da FBG (nm)
Am = 0.44;                                                                  % Amplitude de Modulação
d = 0;                                                                     % Percentual de distorção
Ad = (Am*d)/100;                                                            % Amplitude de distorção do modulador
Mod_FBG = Lc + Am*cos(W0) + Ad*cos(2*W0);                                   % Sinal modulado da FBG 
%% CARACTERIZAÇÃO DA LPG
P0 = 0.31257;                                                               % Potência da fonte ótica
a = 0.008;                                                                  % Largura de banda da banda de atenuação da LPG
m = 0.84;                                                                   % Amplitude Normalizada
lbds = 1500:0.01:1590;                                                      % Variação de lambdas (S)
banda = P0*(1-m*exp(-a*(Lr-lbds).^2));                                      % Banda de atenuação da LPG
%% SINAL DEMODULADO DA LPG
signal_dem = P0*(1-m*exp(-a*(Lr-Mod_FBG).^2));
%% REMOVENDO O NIVEL DC
vetor_sum = sum(signal_dem);
level_DC = vetor_sum/length(signal_dem);
DC = signal_dem - level_DC;
%% NORMALIZAÇÃO DO SINAL DEMODULADO DA LPG
norm = DC/max(abs(DC))*0.8;
%% GRAVAÇÃO EM ARQUIVO CSV DOS VALORES CALCULADOS PARA O LAMBDA DE 1555nm
if length(norm) == L && Lr == 1555
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1555nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1554
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1554nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif (length(norm) == L && Lr == 1553)
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1553nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1552
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1552nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1551
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1551nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1550
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1550nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1549
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1549nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1548
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1548nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1547
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1547nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1546
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1546nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1545
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1545nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1544
     writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1544nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1543
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1543nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1542
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1542nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1541
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1541nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1540
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1540nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1539
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1539nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1538
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1538nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1537
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1537nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
elseif length(norm) == L && Lr == 1536
    writematrix(norm','C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\6. Sinal demodulado LPG (teoria)\2. CSV\1536nm.csv')
    X = ['Gravação concluída para ',num2str(Lr),'nm'];
    disp(X)
    disp('Fim da Gravação...')
end
end