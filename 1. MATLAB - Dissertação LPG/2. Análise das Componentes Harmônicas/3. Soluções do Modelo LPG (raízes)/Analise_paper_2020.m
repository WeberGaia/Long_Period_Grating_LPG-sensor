%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   UNIVERSIDADE FEDERAL FLUMINENSE                       %         
%   PROGRAMA DE PÓS-GRADUAÇÃO EM ENGENHARIA ELÉTRICA E TELECOMUNICAÇÕES   %
%           ORIENTADOR: PROF. DR. ANDRÉS PABLO LOPEZ BARBERO              %
%                     WEBER DE SOUZA GAIA FILHO                           %
%                   TÉCNICAS DE INTERROGAÇÃO DE LPG                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
close all
clear 
clc
%% 
a =  0.008;             % a = 2/w^2 => Abertura da gaussiana
Am = 0.44;              % Amplitude de modulação da FBG
d = 11;                 % Percentual de distorção no modulador
Ad = (Am.*d)/100;       % Amplitude da distorção no segundo harmonico
P0 = 0.31257;           % Amplitude da Potência Ótica(mV)
yc = 0.05;              % Amplitude da Potência Ótica no ponto de ressonânica da LPG
m = 1-(yc/P0);          % Profundidade Normalizida LPG na Ressonância
lc = 1520:0.01:1560;    % Comprimento de onda de ressonânica possíves para a LPG
lr = 1540;              % Comprimento de onda de Ressonância da FBG
S = lr-lc;              

i=1;
for i=1:length(S)
    for j = 1:length(d)
H1(i,j) = (1/6)*exp(-a*S(i)^2 )*3*a*Am*(-2*Ad(j)*(-1+2*a*S(i)^2)...
    -(4-3*a*(2*Ad(j)^2+Am^2)+2*a^2*(2*Ad(j)^2+Am^2)*S(i)^2)*S(i))*P0*m;

H2(i,j) = (1/6)*exp(-a*S(i)^2)*3*a*(-Am^2*(-1+2*a*S(i)^2)-Ad(j)*(4-3*a*...
    (Ad(j)^2+2*Am^2)+2*a^2*(Ad(j)^2+2*Am^2)*S(i)^2)*S(i))*P0*m;
    end
end

H = (H1./H2);

% k13 = -4*a^2*Ad.^2.*Am-2*a^2*Am.^3; 
% k12 = -4*Ad.*a.*Am;                 
% k11 = -4.*Am+6*a.*Ad.^2.*Am+3*a.*Am.^3;
% k10 = 2*Ad.*Am;
% 
% k23= -2*a^2*Ad.^3-4*a^2*Ad.*Am.^2;
% k22 = -2*a*Am.^2;
% k21 = -4*Ad+3*a*Ad.^3+6*a*Ad.*Am.^2;
% k20 = Am.^2 ;
% 
% A = k23.*H-k13;
% B = k22.*H-k12;
% C = k21.*H-k11;
% D = k20.*H-k10;
% 
% %     for i = 1:length(S)
% %     w(i) = roots([A(i) B(i) C(i) D(i)]);
% %     
% %     x1(i) = w(:,1);
% %     x2(i) = w(:,2);
% %     x3(i) = w(:,3);
% %     end
% 
%  X2 = (-C + sqrt(C.^2 - 4*B.*D))./(2*B);
%  X1 = (-C - sqrt(C.^2 - 4*B.*D))./(2*B);
%  
%  fase = angle(H2);
% for j =1:length(1)
%     for i=1:length(H)
%         if fase(i,j) > 0
%             l(i,j) = X1(i,j) + lr;
%             SS(i,j) = X1(i,j);
%         else 
%             l(i,j) = X2(i,j) + lr;
%             SS(i,j) = X2(i,j);
%         end
%     end
% end
%  
%  figure (1)
% title('Harmônicos com amplitude e Fase linear') 
%     subplot (2,2,1)
%     plot (lc,H1,'r')
%     title ('H_1^d')
%     ylabel('Amplitude(mV)')
%     % yyaxis right
%     % plot (lambda,angle(H1))
%     % ylim([-4 4])
%     % ylabel('Fase(\pi rad)')
%     grid on
%     grid minor
% subplot (2,2,2)
%     plot (lc,H2)
%     ylabel('Amplitude(mV)')
%     % yyaxis right
%     % plot (lambda,angle(H2))
%     % ylim([-1.3 4])
%     % ylabel('Fase(\pi rad)')
%     title ('H_2^d')
%     grid on
%     grid minor
% subplot (2,2,3)
%     plot (lc,angle(H1))
%     ylim([-1.3 4])
%     ylabel('Fase(\pi rad)')
%     title ('Fase H_1^d')
%     grid on;
%     grid minor
% subplot (2,2,4)
%     plot (lc,angle(H2))
%     ylim([-1.3 4])
%     ylabel('Fase(\pi rad)')
%     title ('Fase H_2^d')
%     grid on;
%     grid minor
%     lgd=legend ({'3%','4%','5%','6%','9%','12%'},'FontSize',11);
%     title(lgd,'Distorção \fontsize{11}')
%     
%  figure(2)
%     hold on
%     plot (S(1903:4001),X2(1903:4001),'LineWidth',2,'Color','b')
%     plot (S(1:1902),X1(1:1902),'LineWidth',2,'Color','r')
%     ax = gca;
%     ax.FontSize = 16;
%     xlim([-20 20])
%     grid on
% %     grid minor
%     xlabel ('Wavelenght Shift S (\lambda_r-\lambda_c)(nm)','FontSize',18,'FontWeight','bold')
%     ylim([-20 20])
%     ylabel ('Calculated Values S_1 and S_2','FontSize',18,...
%        'FontWeight','bold')
%     text(-15,14,'Roots S_1 -','Color','r','FontSize',16)
%     text(-15,11,'Roots S_2 -','Color','b','FontSize',16)
%     text(-15,8,'H_2 Phase --','Color','m','FontSize',16)
%     yyaxis right
%     plot (S,angle(H2),'--','LineWidth',1,'Color','m')
%     ax=gca;
%     ax.YColor = 'm';
%     ylim([-3.8 3.5])
%     ylabel ('H_2 Phase (\pi rad)','Fontsize',18,'Fontweight','bold')
%     
%     figure(3)
%         plot (S, H2,'LineWidth',2)
%         xlabel('Wavelenght Shift S (\lambda_r-\lambda_c)(nm)','FontSize',18,'FontWeight','bold')
%         ylabel('H_2 Amplitude (mV)','FontSize',18,'FontWeight','bold')
%         text(-15,-0.0005,'H_2 Amplitude','FontSize',16)
%         text(-15,-0.0007,'H_2 Phase --','FontSize',16)
%         ax = gca;
%         ax.FontSize = 16;
%         yyaxis right
%         plot (S,angle(H2),'--','LineWidth',1.5)
%         ylim([-1.8 3.5])
%         ylabel('H_2 Phase (\pi rad)','Fontsize',18,'FontWeight','bold')
%         grid on
%         grid minor
