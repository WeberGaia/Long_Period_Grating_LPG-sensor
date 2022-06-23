function [freq,P1,Lr,H1,H2,indice_H1,indice_H2] = Interrogador_1800Hz_ruido(Lr,d)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%% DISTORÇÃO 1%
if Lr == 1530 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1530nm')
elseif Lr == 1531 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1531nm')
elseif Lr == 1532 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1532nm')
elseif Lr == 1533 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1533nm')
elseif Lr == 1534 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1534nm')
elseif Lr == 1535 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1535nm')
elseif Lr == 1536 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1536nm')
elseif Lr == 1537 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1537nm')
elseif Lr == 1538 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1538nm')
elseif Lr == 1539 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1539nm')
elseif Lr == 1545 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1545nm')
elseif Lr == 1546 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1546nm')
elseif Lr == 1547 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1547nm')
elseif Lr == 1548 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1548nm')
elseif Lr == 1549 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1549nm')
elseif Lr == 1550 && d == 1
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 1%\1550nm')
end
%% DISTORÇÃO 2%
if Lr == 1530 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1530nm')
elseif Lr == 1531 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1531nm')
elseif Lr == 1532 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1532nm')
elseif Lr == 1533 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1533nm')
elseif Lr == 1534 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1534nm')
elseif Lr == 1535 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1535nm')
elseif Lr == 1536 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1536nm')
elseif Lr == 1537 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1537nm')
elseif Lr == 1538 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1538nm')
elseif Lr == 1539 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1539nm')
elseif Lr == 1545 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1545nm')
elseif Lr == 1546 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1546nm')
elseif Lr == 1547 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1547nm')
elseif Lr == 1548 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1548nm')
elseif Lr == 1549 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1549nm')
elseif Lr == 1550 && d == 2
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 2%\1550nm')
end
%% DISTORÇÃO 3%
if Lr == 1530 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1530nm')
elseif Lr == 1531 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1531nm')
elseif Lr == 1532 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1532nm')
elseif Lr == 1533 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1533nm')
elseif Lr == 1534 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1534nm')
elseif Lr == 1535 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1535nm')
elseif Lr == 1536 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1536nm')
elseif Lr == 1537 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1537nm')
elseif Lr == 1538 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1538nm')
elseif Lr == 1539 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1539nm')
elseif Lr == 1545 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1545nm')
elseif Lr == 1546 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1546nm')
elseif Lr == 1547 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1547nm')
elseif Lr == 1548 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1548nm')
elseif Lr == 1549 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1549nm')
elseif Lr == 1550 && d == 3
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3%\1550nm')
end
%% DISTORÇÃO 3.35%
if Lr == 1530 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1530nm')
elseif Lr == 1531 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1531nm')
elseif Lr == 1532 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1532nm')
elseif Lr == 1533 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1533nm')
elseif Lr == 1534 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1534nm')
elseif Lr == 1535 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1535nm')
elseif Lr == 1536 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1536nm')
elseif Lr == 1537 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1537nm')
elseif Lr == 1538 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1538nm')
elseif Lr == 1539 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1539nm')
elseif Lr == 1545 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1545nm')
elseif Lr == 1546 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1546nm')
elseif Lr == 1547 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1547nm')
elseif Lr == 1548 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1548nm')
elseif Lr == 1549 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1549nm')
elseif Lr == 1550 && d == 3.35
    load('C:\Users\weber\Desktop\Resultados Experimentais\Fase 4 ruido\1800Hz\Distorção 3.35%\1550nm')
end
end