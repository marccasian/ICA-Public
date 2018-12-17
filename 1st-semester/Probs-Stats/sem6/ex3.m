%ex3
% M/M/1 q.syst
miuA = 10; %mins
lamA = 1/miuA;
miuS = 3; %mins
lamS = 1/miuS;
r = lamA / lamS;

%a
a_exp_X = r / (1-r)
%b
b_P_X_eq_0 = 1-r 
%c
c_exp_R = miuS/(1-r) %mins
%d
% P_X_less_2  = P_X_eq_0 + P_X_eq_1
d_P_X_less_2 = (1-r) + r*(1-r) % = pi1+pi2
