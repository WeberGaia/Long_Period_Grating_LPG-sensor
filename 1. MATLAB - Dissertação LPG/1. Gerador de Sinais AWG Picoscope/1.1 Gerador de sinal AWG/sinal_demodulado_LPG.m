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
%% 1555 nm
tic
% [banda,lbds,Lr] = generator_CSV_lbds(1555);
figure(1)
% plot(lbds,banda)
title('Variação de \lambda_r','FontWeight','bold')
xlabel('\lambda_r')
ylabel('Amplitude Normalizada','FontWeight','bold')
grid on
hold on
%% 1554nm
% [banda,lbds,Lr] = generator_CSV_lbds(1554);
% plot(lbds,banda)
% hold on
%% 1553nm
% [banda,lbds,Lr] = generator_CSV_lbds(1553);
% plot(lbds,banda)
% hold on
%% 1552nm
% [banda,lbds,Lr] = generator_CSV_lbds(1552);
% plot(lbds,banda)
% hold on
%% 1551nm
% [banda,lbds,Lr] = generator_CSV_lbds(1551);
% plot(lbds,banda)
% hold on
%% 1550nm
% [banda,lbds,Lr] = generator_CSV_lbds(1550);
% plot(lbds,banda)
% hold on
%% 1549nm
% [banda,lbds,Lr] = generator_CSV_lbds(1549);
% plot(lbds,banda)
% hold on
%% 1548nm
% [banda,lbds,Lr] = generator_CSV_lbds(1548);
% plot(lbds,banda)
% hold on
%% 1547nm
% [banda,lbds,Lr] = generator_CSV_lbds(1547);
% plot(lbds,banda)
% hold on
%% 1546nm
% [banda,lbds,Lr] = generator_CSV_lbds(1546);
% plot(lbds,banda)
% hold on
%% 1545nm
[banda,lbds,Lr] = generator_CSV_lbds(1545);
plot(lbds,banda)
hold on
%% 1544nm
[banda,lbds,Lr] = generator_CSV_lbds(1544);
plot(lbds,banda)
hold on
%% 1543nm
[banda,lbds,Lr] = generator_CSV_lbds(1543);
plot(lbds,banda)
hold on
%% 1542nm
[banda,lbds,Lr] = generator_CSV_lbds(1542);
plot(lbds,banda)
hold on
%% 1541nm
[banda,lbds,Lr] = generator_CSV_lbds(1541);
plot(lbds,banda)
hold on
%% 1540nm
[banda,lbds,Lr] = generator_CSV_lbds(1540);
plot(lbds,banda)
hold on
%% 1539nm
[banda,lbds,Lr] = generator_CSV_lbds(1539);
plot(lbds,banda)
hold on
%% 1538nm
[banda,lbds,Lr] = generator_CSV_lbds(1538);
plot(lbds,banda)
hold on
%% 1537nm
[banda,lbds,Lr] = generator_CSV_lbds(1537);
plot(lbds,banda)
hold on
%% 1536nm
[banda,lbds,Lr] = generator_CSV_lbds(1536);
plot(lbds,banda)
hold on
% xlim([1510 1580])
%% 
% lgd = legend('1555','1554','1553','1552','1551','1550','1549','1548'...
%     ,'1547','1546','1545','1544','1543','1542','1541','1540','1539'...
%     ,'1538','1537','1536','Location','southeast','FontWeight','bold');
% title(lgd,'\lambda_r(nm)')
lgd = legend('1545','1544','1543','1542','1541','1540','1539'...
    ,'1538','1537','1536','Location','southeast','FontWeight','bold');
title(lgd,'\lambda_r(nm)')
toc