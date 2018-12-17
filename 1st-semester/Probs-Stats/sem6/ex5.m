%ex5
%a
%M/M/inf
lamA = 3/2; %min
miuS = 20; %min
lamS = 1/miuS; %min
r = lamA/lamS;
%b
b_exp_X = r%X has POisson(r)
%c 
%c_P_X_gr_or_eq_40 =  1 - P_X_less_40 = 1-P(X_less_or_eq_39
c_P_X_gr_or_eq_40 = 1 - poisscdf(39,30)