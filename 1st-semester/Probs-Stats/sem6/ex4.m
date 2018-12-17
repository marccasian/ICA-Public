%ex4
% M/M/3 q.syst

lamA = 1/5; %sec
miuS = 12; %sec
lamS = 1/miuS; %sec
k = 3;
r = lamA/lamS;
% P(Xw>=10) = P(X >= 13) = sum_x=(13..inf)(piX)
pi0 = 1/(1+r+r*r/2+r*r*r/(1*2*3*(1-r/3)))
% x>=3
%pix = r*r*r/(1*2*3)*pi0*(r/3)^(x-3)
P_Xw_gr_or_eq_10 = (((r^3)*pi0)/6)*((r/3)^10)*(1/(1-r/3))