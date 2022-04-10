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
%% Variação de S
% lbd = -30:0.01:30;
lbd = 1520:0.01:1560;
lbd = lbd-1540;
%% VARIAÇÃO DE AMPLITUDE NAS COMPONENTES DC E HARMÔNICAS
%% Amplitude de Modulação de 0.2nm
[H1,DC,H2,H3] = AM(lbd,0.2);
figure(1)
subplot(2,2,1)
plot(lbd,DC)
hold on
grid on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('DC')

subplot(2,2,2)
plot(lbd,H1)
hold on
grid on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H1')

subplot(2,2,3)
plot(lbd,H2)
hold on
grid on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H2')

subplot(2,2,4)
plot(lbd,H3)
hold on
grid on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H3')
%% Amplitude de Modulação de 0.3nm
[H1,DC,H2,H3] = AM(lbd,0.3);
figure(1)
subplot(2,2,1)
plot(lbd,DC)
hold on

subplot(2,2,2)
plot(lbd,H1)
hold on

subplot(2,2,3)
plot(lbd,H2)
hold on

subplot(2,2,4)
plot(lbd,H3)
hold on
%% Amplitude de Modulação de 0.4nm
[H1,DC,H2,H3] = AM(lbd,0.4);
figure(1)
subplot(2,2,1)
plot(lbd,DC)
hold on

subplot(2,2,2)
plot(lbd,H1)
hold on

subplot(2,2,3)
plot(lbd,H2)
hold on

subplot(2,2,4)
plot(lbd,H3)
hold on

%% Amplitude de Modulação de 0.5nm
[H1,DC,H2,H3] = AM(lbd,0.5);
figure(1)
subplot(2,2,1)
plot(lbd,DC)
hold on

subplot(2,2,2)
plot(lbd,H1)
hold on

subplot(2,2,3)
plot(lbd,H2)
hold on

subplot(2,2,4)
plot(lbd,H3)
hold on
%% Amplitude de Modulação de 0.6nm
[H1,DC,H2,H3,H] = AM(lbd,0.6);
figure(1)
subplot(2,2,1)
plot(lbd,DC)
hold on

subplot(2,2,2)
plot(lbd,H1)
hold on

subplot(2,2,3)
plot(lbd,H2)
hold on

subplot(2,2,4)
plot(lbd,H3)
hold on
legend('Am = 0.2 nm','Am = 0.3 nm','Am = 0.4 nm','Am = 0.5 nm','Am = 0.6 nm','NumColumns',2)
% 
%% VARIAÇÃO DA LARGURA ESPECTRAL DA BANDA DA LPG
[H1,DC,H2,H3] = larg_espec(lbd,0.012);
figure(2)
subplot(2,2,1)
plot(lbd, DC)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('DC')

subplot(2,2,2)
plot(lbd, H1)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H1')

subplot(2,2,3)
plot(lbd, H2)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H2')

subplot(2,2,4)
plot(lbd, H3)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H3')
%% 
[H1,DC,H2,H3] = larg_espec(lbd,0.015);
subplot(2,2,1)
plot(lbd, DC)
hold on

subplot(2,2,2)
plot(lbd, H1)
hold on

subplot(2,2,3)
plot(lbd, H2)
hold on

subplot(2,2,4)
plot(lbd, H3)
hold on
%% 
[H1,DC,H2,H3] = larg_espec(lbd,0.01);
subplot(2,2,1)
plot(lbd, DC)
hold on

subplot(2,2,2)
plot(lbd, H1)
hold on

subplot(2,2,3)
plot(lbd, H2)
hold on

subplot(2,2,4)
plot(lbd, H3)
hold on
%% 
[H1,DC,H2,H3] = larg_espec(lbd,0.008);
subplot(2,2,1)
plot(lbd, DC)
hold on

subplot(2,2,2)
plot(lbd, H1)
hold on

subplot(2,2,3)
plot(lbd, H2)
hold on

subplot(2,2,4)
plot(lbd, H3)
hold on
%% 
[H1,DC,H2,H3] = larg_espec(lbd,0.006);
subplot(2,2,1)
plot(lbd, DC)
hold on

subplot(2,2,2)
plot(lbd, H1)
hold on

subplot(2,2,3)
plot(lbd, H2)
hold on

subplot(2,2,4)
plot(lbd, H3)
hold on
%% 
[H1,DC,H2,H3] = larg_espec(lbd,0.004);
subplot(2,2,1)
plot(lbd, DC)
hold on
legend('a = 0.012 nm','a = 0.015 nm','a = 0.01 nm','a = 0.008 nm','a = 0.006 nm','a = 0.004 nm','NumColumns',2)
subplot(2,2,2)
plot(lbd, H1)
hold on

subplot(2,2,3)
plot(lbd, H2)
hold on

subplot(2,2,4)
plot(lbd, H3)
hold on
%% 
%% VARIAÇÃO DA AMPLITUDE NORMALIZADA - M
[DC,H1,H2,H3] = amp_norm(lbd,0.84);
figure(3)
subplot(2,2,1)
plot(lbd, DC)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('DC')

subplot(2,2,2)
plot(lbd, H1)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H1')

subplot(2,2,3)
plot(lbd, H2)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H2')

subplot(2,2,4)
plot(lbd, H3)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H3')
%% 
[DC,H1,H2,H3] = amp_norm(lbd,0.92);
figure(3)
subplot(2,2,1)
plot(lbd, DC)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('DC')

subplot(2,2,2)
plot(lbd, H1)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H1')

subplot(2,2,3)
plot(lbd, H2)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
title('H2')

subplot(2,2,4)
plot(lbd, H3)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
title('H3')
%% 
[DC,H1,H2,H3] = amp_norm(lbd,0.96);
figure(3)
subplot(2,2,1)
plot(lbd, DC)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
title('DC')

subplot(2,2,2)
plot(lbd, H1)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
title('H1')

subplot(2,2,3)
plot(lbd, H2)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
title('H2')

subplot(2,2,4)
plot(lbd, H3)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
title('H3')
%% 
[DC,H1,H2,H3] = amp_norm(lbd,0.98);
figure(3)
subplot(2,2,1)
plot(lbd, DC)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('DC')
legend('m = 0.84','m = 0.92','m = 0.96','m = 0.98')

subplot(2,2,2)
plot(lbd, H1)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H1')

subplot(2,2,3)
plot(lbd, H2)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H2')

subplot(2,2,4)
plot(lbd, H3)
grid on
hold on
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
ylabel('Amplitude(dB)')
title('H3')
%% 
%% 