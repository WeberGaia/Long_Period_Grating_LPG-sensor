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
%% EXPANSÃO EM SÉRIE DE TAYLOR
% lambdas = 1520:0.01:1580;
Lc = 1550;
S = -30:0.01:30;
% Lr = 1540;
% Lc = 1540.1;
% S = Lr-Lc;
P0 = 0.31257;                                                               % Potência Ótica da fonte
a = 0.01;                                                                   % Largura da gaussiana da função de transferência
m = 0.98;   
Am = 0.44;
d = 0;
Ad=(Am*d)/100;

DC = P0 + 1/2.*exp(-a.*S.^2).*m.*P0.*(-2+a.*(Ad.^2+Am.^2)-2.*a.^3.*Ad.*Am.^2.*S.^3+...
    a.^2.*S.*(3.*Ad.*Am.^2-2.*Ad.^2.*S-2.*Am.^2.*S));

H1 = 1/2.*a.*Am.*exp(-a.*S.^2).*m.*P0.*(Ad.*(2-4.*a.*S.^2)-2.*a.*Ad.^2.*S.*...
    (-3+2.*a.*S.^2)-S.*(4-3.*a.*Am.^2+2.*a.^2.*Am.^2.*S.^2));

H2 = 1/2.*a.*exp(-a.*S.^2).*m.*P0.*(-Ad.*S.*(4-3.*a.*Ad.^2+2.*a.^2.*...
    Ad.^2.*S.^2)+Am.^2.*(1+2.*a.*(3.*Ad-S).*S-4.*a.^2.*Ad.*S.^3));

H3 = 1/6.*a.*Am.*exp(-a.*S.^2).*m.*P0.*(-3.*a.*Ad.^2.*S.*(-3+2.*a.*S.^2)...
    -a.*Am.^2.*S.*(-3+2.*a.*S.^2)-6.*Ad.*(-1+2.*a.*S.^2));
%% 
dDC = 10*log10(DC);
dH1 = 10*log10(H1);
dH2 = 10*log10(H2);
dH3 = 10*log10(H3);
%% 
figure(2)
subplot(2,2,1)
plot(S,DC)
title('DC')
xlabel('S = \lambda_r - \lambda_c')
ylabel('Amplitude(mV)')
% legend('a = 0.01nm','a = 0.02nm','a = 0.03nm','a = 0.04nm','a = 0.05nm')
% legend('Am = 0.2nm','Am = 0.3nm','Am = 0.4nm','Am = 0.5nm','Am = 0.6nm')
legend('m = 0.84','m = 0.92','m = 0.96','m = 0.98')
hold on
grid on
grid minor

subplot(2,2,2)
plot(S,H1)
title('H_1')
ylabel('Amplitude(mV)')
xlabel('S = \lambda_r - \lambda_c')
% legend('a = 0.01nm','a = 0.02nm','a = 0.03nm','a = 0.04nm','a = 0.05nm')
% legend('Am = 0.2nm','Am = 0.3nm','Am = 0.4nm','Am = 0.5nm','Am = 0.6nm')
legend('m = 0.84','m = 0.92','m = 0.96','m = 0.98')
hold on
grid on
grid minor

subplot(2,2,3)
plot(S,H2)
title('H_2')
ylabel('Amplitude(mV)')
xlabel('S = \lambda_r - \lambda_c')
% legend('a = 0.01nm','a = 0.02nm','a = 0.03nm','a = 0.04nm','a = 0.05nm')
% legend('Am = 0.2nm','Am = 0.3nm','Am = 0.4nm','Am = 0.5nm','Am = 0.6nm')
legend('m = 0.84','m = 0.92','m = 0.96','m = 0.98')
hold on
grid on
grid minor

subplot(2,2,4)
plot(S,H3)
title('H_3')
ylabel('Amplitude(mV)')
xlabel('S = \lambda_r - \lambda_c')
% legend('a = 0.01nm','a = 0.02nm','a = 0.03nm','a = 0.04nm','a = 0.05nm')
% legend('Am = 0.2nm','Am = 0.3nm','Am = 0.4nm','Am = 0.5nm','Am = 0.6nm')
legend('m = 0.84','m = 0.92','m = 0.96','m = 0.98')
hold on
grid on
grid minor

figure(3)
subplot(2,2,1)
plot(S,dDC)
title('DC')
xlabel('S = \lambda_r - \lambda_c')
ylabel('dB')
% legend('a = 0.01nm','a = 0.02nm','a = 0.03nm','a = 0.04nm','a = 0.05nm')
% legend('Am = 0.2nm','Am = 0.3nm','Am = 0.4nm','Am = 0.5nm','Am = 0.6nm')
legend('m = 0.84','m = 0.92','m = 0.96','m = 0.98')
hold on
grid on
grid minor
subplot(2,2,2)
plot(S,dH1)
title('H_1')
ylabel('dB')
xlabel('S = \lambda_r - \lambda_c')
% legend('a = 0.01nm','a = 0.02nm','a = 0.03nm','a = 0.04nm','a = 0.05nm')
% legend('Am = 0.2nm','Am = 0.3nm','Am = 0.4nm','Am = 0.5nm','Am = 0.6nm')
legend('m = 0.84','m = 0.92','m = 0.96','m = 0.98')
hold on
grid on
grid minor
subplot(2,2,3)
plot(S,dH2)
title('H_2')
ylabel('dB')
xlabel('S = \lambda_r - \lambda_c')
% legend('a = 0.01nm','a = 0.02nm','a = 0.03nm','a = 0.04nm','a = 0.05nm')
% legend('Am = 0.2nm','Am = 0.3nm','Am = 0.4nm','Am = 0.5nm','Am = 0.6nm')
legend('m = 0.84','m = 0.92','m = 0.96','m = 0.98')
hold on
grid on
grid minor
subplot(2,2,4)
plot(S,dH3)
title('H_3')
ylabel('dB')
xlabel('S = \lambda_r - \lambda_c')
% legend('a = 0.01nm','a = 0.02nm','a = 0.03nm','a = 0.04nm','a = 0.05nm')
% legend('Am = 0.2nm','Am = 0.3nm','Am = 0.4nm','Am = 0.5nm','Am = 0.6nm')
legend('m = 0.84','m = 0.92','m = 0.96','m = 0.98')
hold on
grid on
grid minor
%% 
% plot(S,(dH1-dH2))