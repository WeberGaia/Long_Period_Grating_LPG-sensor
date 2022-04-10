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
%% DISTORÇÃO 10%
load 'C:\Users\weber\Desktop\Dissertação - Simulador e  Interrogador LPG\3. Arquivos MATLAB\7. Interrogador LPG\1. 400Hz\4. Dados com distorções\1538nm\Distorção 10% - Dados - 1538nm\DAQ6216_1s_2400.mat'
DAQ1 = volt5;
clear volt5
L = length(DAQ1);
t1 = (0:L-1)*(1/length(DAQ1));
d = 10;
Lr2 = 1538;
% figure(1)
% plot(t,DAQ1)
% xlim([0 0.1])
% 
Y1 = fft(DAQ1);
P_DAQ1 = abs(Y1/L);
P1_DAQ1 = P_DAQ1(1:L/2+1);
P1_DAQ1(:,2:end-1) = 2*P1_DAQ1(:,2:end-1);
FREQ = length(DAQ1)*(0:(L/2))/L; 
% 
fase1 = angle(Y1);
aux1 = fase1/L;
aux2 = ceil(((1200*400)/(2400/2)));
aux3 = aux2*2;
H1 = abs(P_DAQ1(aux2+1));
H2 = abs(P_DAQ1(aux3+1));
H = H1/H2;
H1 = 10*log10(H1);
H2 = 10*log10(H2);
% 
Am = 0.44;
a = 0.01;
Ad = (Am*d)/100;
Lc = 1540;

k13 = -4*a^2*Ad.^2.*Am-2*a^2*Am.^3; 
k12 = -4*Ad.*a.*Am;                 
k11 = -4.*Am+6*a.*Ad.^2.*Am+3*a.*Am.^3;
k10 = 2*Ad.*Am;

k23= -2*a^2*Ad.^3-4*a^2*Ad.*Am.^2;
k22 = -2*a*Am.^2;
k21 = -4*Ad+3*a*Ad.^3+6*a*Ad.*Am.^2;
k20 = Am.^2 ;

B = k22.*H-k12;
C = k21.*H-k11;
D = k20.*H-k10;
% 
S1 = (-C + sqrt(C.^2 - 4*B.*D))/(2*B);
S2 = (-C - sqrt(C.^2 - 4*B.*D))/(2*B);
L1= S1 + Lc
L2= S2 + Lc

fase = rad2deg(aux1(aux3));

if fase > 0
    Lr = S1 + Lc;
else
    Lr = S2  + Lc;
end
%%
fh = figure(1);
fh.WindowState = 'maximized';
plot(FREQ,10*log10(P1_DAQ1),'b')
sub = ['Lr: ','\color{red}',num2str(Lr),'nm'];
tit = ['Interrogador LPG para ',num2str(Lr2),'nm c/ distorção de ',num2str(d),'%'];
title(tit)
subtitle(sub,'FontWeight','bold')
txt1 = ['\leftarrow H1: ',num2str(H1),' dB'];
txt2 = ['\leftarrow H2: ',num2str(H2),' dB'];
text(aux2,H1,txt1,'FontWeight','bold','FontSize',11)
text(aux3,H2,txt2,'FontWeight','bold','FontSize',11)
grid on
grid minor

%% OBSERVAÇÕES
% Para cada arquivo, devo analisar o H1, H2 e os pontos onde estão as
% amplitudes dos harmônicos. Aqui faz toda a diferença, pois é o que
% determina a validação do índice de Refração do arquivo