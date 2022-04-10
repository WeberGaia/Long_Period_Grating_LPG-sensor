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
%% Plotagem gráfica e chamadas de funções da variação de Am na relação de H1 - H2
S = -30:0.01:30;

H = function_Am(0.02);
figure(1)
plot(S,H)
grid on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude (dB)')
title('Influência de Am em H1 / H2')
hold on

H = function_Am(0.03);
plot(S,H)
hold on

H = function_Am(0.04);
plot(S,H)
hold on

H = function_Am(0.05);
plot(S,H)
hold on

H = function_Am(0.06);
plot(S,H)
hold on
legend('Am = 0.2 nm','Am = 0.3 nm','Am = 0.4 nm','Am = 0.5 nm','Am = 0.6 nm')
%% Influência da Largura espectral
H_a = function_A(0.015);
figure(2)
plot(S,H_a)
title('Influência da largura espectral - H1 / H2')
hold on
grid on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude (dB)')

H_a = function_A(0.012);
plot(S,H_a)
hold on

H_a = function_A(0.01);
plot(S,H_a)
hold on

H_a = function_A(0.008);
plot(S,H_a)
hold on

H_a = function_A(0.006);
plot(S,H_a)
hold on

H_a = function_A(0.004);
plot(S,H_a)
hold on
legend('a = 0.015 nm','a = 0.012 nm','a = 0.01 nm','a = 0.008 nm','a = 0.006 nm','a = 0.004 nm','NumColumns',2)