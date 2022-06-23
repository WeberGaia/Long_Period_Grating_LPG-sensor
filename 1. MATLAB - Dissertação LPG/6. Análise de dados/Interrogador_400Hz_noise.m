%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   UNIVERSIDADE FEDERAL FLUMINENSE                       %         
%   PROGRAMA DE PÓS-GRADUAÇÃO EM ENGENHARIA ELÉTRICA E TELECOMUNICAÇÕES   %
%           ORIENTADOR: PROF. DR. ANDRÉS PABLO LOPEZ BARBERO              %
%                     WEBER DE SOUZA GAIA FILHO                           %
%                   TÉCNICAS DE INTERROGAÇÃO DE LPG                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% VARIÁVEIS DE LIMPEZA E DE ESCALA 
clear all
close all
clc
xmin = 0;
xmax = 5000;
ymin = -55;
ymax = 0;
%% DISTORÇÃO 1%
format long
lambda = 1531
d = 1;
[freq,P1,Lr1,H1,H2,indice_H1,indice_H2] = Interrogador_400Hz_ruido(lambda,d);
fh1 = figure(1);
fh1.WindowState = 'maximized';  
figure(1)
subplot(2,2,1)
plot(freq,10*log10(P1))                                                     % Plotagem gráfica
xlim([xmin xmax])                                                           % Limitação do eixo X
ylim([ymin ymax])                                                           % Limitação do eixo Y
txt1 = ['\leftarrow H1: ',num2str(H1),' dB'];                               % Strings dinâmica para plotar o valor de H1
txt2 = ['\leftarrow H2: ',num2str(H2),' dB'];                               % Strings dinâmica para plotar o valor de H2
text(indice_H1,H1,txt1,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
text(indice_H2,H2,txt2,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
tit2 = ['Interrogador 400Hz LPG - FFT   ','(',num2str(lambda),'nm)   ','Distorção: ',num2str(d),'%'];                                  % Título do gráfico
title(tit2) 
sub = ['\color{red}', 'Lr:' num2str(Lr1),'nm'];
subtitle(sub,'FontWeight','bold')
xlabel('Frequência (Hz)')
ylabel('Amplitude (dB)')
grid on
grid minor
%% DISTORÇÃO 2%
d = 2;
[freq,P1,Lr2,H1,H2,indice_H1,indice_H2] = Interrogador_400Hz_ruido(lambda,d);
subplot(2,2,2)
plot(freq,10*log10(P1))                                                     % Plotagem gráfica
xlim([xmin xmax])                                                           % Limitação do eixo X
ylim([ymin ymax])                                                           % Limitação do eixo Y
txt1 = ['\leftarrow H1: ',num2str(H1),' dB'];                               % Strings dinâmica para plotar o valor de H1
txt2 = ['\leftarrow H2: ',num2str(H2),' dB'];                               % Strings dinâmica para plotar o valor de H2
text(indice_H1,H1,txt1,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
text(indice_H2,H2,txt2,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
tit2 = ['Interrogador 400Hz LPG - FFT   ','(',num2str(lambda),'nm)   ','Distorção: ',num2str(d),'%'];                                  % Título do gráfico
title(tit2) 
sub = ['\color{red}', 'Lr:' num2str(Lr2),'nm'];
subtitle(sub,'FontWeight','bold')
xlabel('Frequência (Hz)')
ylabel('Amplitude (dB)')
grid on
grid minor
%% DISTORÇÃO 3%
d = 3;
[freq,P1,Lr3,H1,H2,indice_H1,indice_H2] = Interrogador_400Hz_ruido(lambda,d);
subplot(2,2,3)
plot(freq,10*log10(P1))                                                     % Plotagem gráfica
xlim([xmin xmax])                                                           % Limitação do eixo X
ylim([ymin ymax])                                                           % Limitação do eixo Y
txt1 = ['\leftarrow H1: ',num2str(H1),' dB'];                               % Strings dinâmica para plotar o valor de H1
txt2 = ['\leftarrow H2: ',num2str(H2),' dB'];                               % Strings dinâmica para plotar o valor de H2
text(indice_H1,H1,txt1,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
text(indice_H2,H2,txt2,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
tit2 = ['Interrogador 400Hz LPG - FFT   ','(',num2str(lambda),'nm)   ','Distorção: ',num2str(d),'%'];                                  % Título do gráfico
title(tit2) 
sub = ['\color{red}', 'Lr:' num2str(Lr3),'nm'];
subtitle(sub,'FontWeight','bold')
xlabel('Frequência (Hz)')
ylabel('Amplitude (dB)')
grid on
grid minor
%% DISTORÇÃO 3.35%
d = 3.35;
[freq,P1,Lr4,H1,H2,indice_H1,indice_H2] = Interrogador_400Hz_ruido(lambda,d);
subplot(2,2,4)
plot(freq,10*log10(P1))                                                     % Plotagem gráfica
xlim([xmin xmax])                                                           % Limitação do eixo X
ylim([ymin ymax])                                                           % Limitação do eixo Y
txt1 = ['\leftarrow H1: ',num2str(H1),' dB'];                               % Strings dinâmica para plotar o valor de H1
txt2 = ['\leftarrow H2: ',num2str(H2),' dB'];                               % Strings dinâmica para plotar o valor de H2
text(indice_H1,H1,txt1,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
text(indice_H2,H2,txt2,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
tit2 = ['Interrogador 400Hz LPG - FFT   ','(',num2str(lambda),'nm)   ','Distorção: ',num2str(d),'%'];                                  % Título do gráfico
title(tit2) 
sub = ['\color{red}', 'Lr:' num2str(Lr4),'nm'];
subtitle(sub,'FontWeight','bold')
xlabel('Frequência (Hz)')
ylabel('Amplitude (dB)')
grid on
grid minor
LR = [Lr1;Lr2;Lr3;Lr4]*1.0e-03