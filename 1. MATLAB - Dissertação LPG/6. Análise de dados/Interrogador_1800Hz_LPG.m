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
ymin = -50;
ymax = 0;
%% DISTORÇÃO 1%
format long
lambda = 1530;
d = 1;
[freq,P1,Lr,H1,H2,indice_H1,indice_H2] = Interrogador_1800Hz(lambda,d);
figure(1)
plot(freq,10*log10(P1))                                                     % Plotagem gráfica
xlim([xmin xmax])                                                           % Limitação do eixo X
ylim([ymin ymax])                                                           % Limitação do eixo Y
txt1 = ['\leftarrow H1: ',num2str(H1),' dB'];                               % Strings dinâmica para plotar o valor de H1
txt2 = ['\leftarrow H2: ',num2str(H2),' dB'];                               % Strings dinâmica para plotar o valor de H2
text(indice_H1,H1,txt1,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
text(indice_H2,H2,txt2,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
tit2 = ['Interrogador 1800Hz LPG - FFT   ','(',num2str(lambda),'nm)   ','Distorção: ',num2str(d),'%'];                                  % Título do gráfico
title(tit2) 
sub = ['\color{red}', 'Lr:' num2str(Lr),'nm'];
subtitle(sub,'FontWeight','bold')
xlabel('Frequência (Hz)')
ylabel('Amplitude (dB)')
grid on
grid minor
%% DISTORÇÃO 2%
d = 2;
[freq,P1,Lr,H1,H2,indice_H1,indice_H2] = Interrogador_1800Hz(lambda,d);
figure(2)
plot(freq,10*log10(P1))                                                     % Plotagem gráfica
xlim([xmin xmax])                                                           % Limitação do eixo X
ylim([ymin ymax])                                                           % Limitação do eixo Y
txt1 = ['\leftarrow H1: ',num2str(H1),' dB'];                               % Strings dinâmica para plotar o valor de H1
txt2 = ['\leftarrow H2: ',num2str(H2),' dB'];                               % Strings dinâmica para plotar o valor de H2
text(indice_H1,H1,txt1,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
text(indice_H2,H2,txt2,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
tit2 = ['Interrogador 1800Hz LPG - FFT   ','(',num2str(lambda),'nm)   ','Distorção: ',num2str(d),'%'];                                  % Título do gráfico
title(tit2) 
sub = ['\color{red}', 'Lr:' num2str(Lr),'nm'];
subtitle(sub,'FontWeight','bold')
xlabel('Frequência (Hz)')
ylabel('Amplitude (dB)')
grid on
grid minor
%% DISTORÇÃO 3%
d = 3;
[freq,P1,Lr,H1,H2,indice_H1,indice_H2] = Interrogador_1800Hz(lambda,d);
figure(3)
plot(freq,10*log10(P1))                                                     % Plotagem gráfica
xlim([xmin xmax])                                                           % Limitação do eixo X
ylim([ymin ymax])                                                           % Limitação do eixo Y
txt1 = ['\leftarrow H1: ',num2str(H1),' dB'];                               % Strings dinâmica para plotar o valor de H1
txt2 = ['\leftarrow H2: ',num2str(H2),' dB'];                               % Strings dinâmica para plotar o valor de H2
text(indice_H1,H1,txt1,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
text(indice_H2,H2,txt2,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
tit2 = ['Interrogador 1800Hz LPG - FFT   ','(',num2str(lambda),'nm)   ','Distorção: ',num2str(d),'%'];                                  % Título do gráfico
title(tit2) 
sub = ['\color{red}', 'Lr:' num2str(Lr),'nm'];
subtitle(sub,'FontWeight','bold')
xlabel('Frequência (Hz)')
ylabel('Amplitude (dB)')
grid on
grid minor
%% DISTORÇÃO 3.35%
d = 3.35;
[freq,P1,Lr,H1,H2,indice_H1,indice_H2] = Interrogador_1800Hz(lambda,d);
figure(4)
plot(freq,10*log10(P1))                                                     % Plotagem gráfica
xlim([xmin xmax])                                                           % Limitação do eixo X
ylim([ymin ymax])                                                           % Limitação do eixo Y
txt1 = ['\leftarrow H1: ',num2str(H1),' dB'];                               % Strings dinâmica para plotar o valor de H1
txt2 = ['\leftarrow H2: ',num2str(H2),' dB'];                               % Strings dinâmica para plotar o valor de H2
text(indice_H1,H1,txt1,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
text(indice_H2,H2,txt2,'FontWeight','bold','FontSize',11)                   % Função para indicação no gráfico
tit2 = ['Interrogador 1800Hz LPG - FFT   ','(',num2str(lambda),'nm)   ','Distorção: ',num2str(d),'%'];                                  % Título do gráfico
title(tit2) 
sub = ['\color{red}', 'Lr:' num2str(Lr),'nm'];
subtitle(sub,'FontWeight','bold')
xlabel('Frequência (Hz)')
ylabel('Amplitude (dB)')
grid on
grid minor