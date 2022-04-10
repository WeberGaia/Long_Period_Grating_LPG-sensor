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
%% INFLUENCIA DA DISTORÇÃO NO PRIMEIRO HARMÔNICO
lbd = -30:0.01:30;
%% Distorção 0% - H1
[H1] = func_H1_dist(lbd,0);
figure(1)
plot(lbd, H1)
hold on
grid on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude (dB)')
% ylim([-80 -10])
title('Influência da distorção em H1')
%% Distorção 3% - H1
[H1] = func_H1_dist(lbd,3);
plot(lbd, H1)
hold on
grid on
%% Distorção 4% - H1
[H1] = func_H1_dist(lbd,4);
plot(lbd, H1)
hold on
grid on
%% Distorção 5% - H1
[H1] = func_H1_dist(lbd,5);
plot(lbd, H1)
hold on
grid on
%% Distorção 6% - H1
[H1] = func_H1_dist(lbd,6);
plot(lbd, H1)
hold on
grid on
%% Distorção 7% - H1
H1 = func_H1_dist(lbd,9);
plot(lbd, H1)
hold on
grid on
%% Distorção 12% - H1
[H1] = func_H1_dist(lbd,12);
plot(lbd, H1)
hold on
grid on
legend('d = 0%','d = 3%','d = 4%','d = 5%','d = 6%','d = 9%','d = 12%')
%% 
%% FASE H1 - Distorção 0%
[~,H1_fase] = func_H1_dist(lbd,0);
figure(2)
plot(lbd,H1_fase)
title('Fase de H1')
ylabel('Fase (\pi rad)')
xlabel('S = \lambda_r - \lambda_c')
hold on
grid on
%% FASE H1 - Distorção 3%
[~,H1_fase] = func_H1_dist(lbd,3);
plot(lbd,H1_fase)
hold on
grid on
%% FASE H1 - Distorção 4%
[~,H1_fase] = func_H1_dist(lbd,4);
plot(lbd,H1_fase)
hold on
grid on
%% FASE H1 - Distorção 5%
[~,H1_fase] = func_H1_dist(lbd,5);
plot(lbd,H1_fase)
hold on
grid on
%% FASE H1 - Distorção 6%
[~,H1_fase] = func_H1_dist(lbd,6);
plot(lbd,H1_fase)
hold on
grid on
%% FASE H1 - Distorção 9%
[~,H1_fase] = func_H1_dist(lbd,9);
plot(lbd,H1_fase)
hold on
grid on
%% FASE H1 - Distorção 12%
[~,H1_fase] = func_H1_dist(lbd,12);
plot(lbd,H1_fase)
hold on
grid on
legend('d = 0%','d = 3%','d = 4%','d = 5%','d = 6%','d = 9%','d = 12%')
%% 
%% INFLUÊNCIA DA DISTORÇÃO NO SEGUNDO HARMÔNICO
%% 
%% Distorção 0%
H2 = func_H2_dist(lbd,0);
figure(3)
plot(lbd, H2)
hold on
grid on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude (dB)')
title('Influência da distorção em H2')
% ylim([-80 -30])
%% Distorção 3%
H2 = func_H2_dist(lbd,3);
plot(lbd, H2)
hold on
grid on
%% Distorção 4%
H2 = func_H2_dist(lbd,4);
plot(lbd, H2)
hold on
grid on
%% Distorção 5%
H2 = func_H2_dist(lbd,5);
plot(lbd, H2)
hold on
grid on
%% Distorção 6%
H2 = func_H2_dist(lbd,6);
plot(lbd, H2)
hold on
grid on
%% Distorção 9%
H2 = func_H2_dist(lbd,9);
plot(lbd, H2)
hold on
grid on
%% Distorção 12%
H2 = func_H2_dist(lbd,12);
plot(lbd, H2)
hold on
grid on
legend('d = 0%','d = 3%','d = 4%','d = 5%','d = 6%','d = 9%','d = 12%')
%% FASE H2
%% %% FASE H2 - Distorção 0%
[~,H2_fase] = func_H2_dist(lbd,0);
figure(4)
plot(lbd,H2_fase)
title('Fase de H2')
ylabel('Fase (\pi rad)')
xlabel('S = \lambda_r - \lambda_c')
hold on
grid on
%% FASE H2 - Distorção 3%
[~,H2_fase] = func_H2_dist(lbd,3);
plot(lbd,H2_fase)
hold on
grid on
%% FASE H2 - Distorção 4%
[~,H2_fase] = func_H2_dist(lbd,4);
plot(lbd,H2_fase)
hold on
grid on
%% FASE H2 - Distorção 5%
[~,H2_fase] = func_H2_dist(lbd,5);
plot(lbd,H2_fase)
hold on
grid on
%% FASE H2 - Distorção 6%
[~,H2_fase] = func_H2_dist(lbd,6);
plot(lbd,H2_fase)
hold on
grid on
%% FASE H2 - Distorção 9%
[~,H2_fase] = func_H2_dist(lbd,9);
plot(lbd,H2_fase)
hold on
grid on
%% FASE H2 - Distorção 12%
[~,H2_fase] = func_H2_dist(lbd,12);
plot(lbd,H2_fase)
hold on
grid on
legend('d = 0%','d = 3%','d = 4%','d = 5%','d = 6%','d = 9%','d = 12%')
%% INFLUENCIA DA DISTORÇÃO NA RELAÇÃO DE H1-H2
%% Distorção 0%
H1_H2 = func_H1_H2_dist(lbd,0);
figure(5)
plot(lbd, H1_H2)
hold on
grid on
title('Influência da distorção em H1-H2')
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude (dB)')
%% Distorção 3%
H1_H2 = func_H1_H2_dist(lbd,3);
plot(lbd, H1_H2)
hold on
grid on
%% Distorção 4%
H1_H2 = func_H1_H2_dist(lbd,4);
plot(lbd, H1_H2)
hold on
grid on
%% Distorção 5%
H1_H2 = func_H1_H2_dist(lbd,5);
plot(lbd, H1_H2)
hold on
grid on
%% Distorção 6%
H1_H2 = func_H1_H2_dist(lbd,6);
plot(lbd, H1_H2)
hold on
grid on
%% Distorção 9%
H1_H2 = func_H1_H2_dist(lbd,9);
plot(lbd, H1_H2)
hold on
grid on
%% Distorção 12%
H1_H2 = func_H1_H2_dist(lbd,12);
plot(lbd, H1_H2)
hold on
grid on
legend('d = 0%','d = 3%','d = 4%','d = 5%','d = 6%','d = 9%','d = 12%')