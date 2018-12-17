% BSS 
k = 2 ;
C = 2;
delta = 0.5; %min
lamA = 1/4; %min
lamS = 1/5; %min
pA = lamA*delta;
pS = lamS*delta;

%a -> states: 0,1,2

P = [1-pA, pA, 0; 
    pS*(1-pA), (1-pA)*(1-pS)+pA*pS, pA*(1-pS); 
    pS*pS*(1-pA), 2*pS*(1-pA)*(1-pS)+ pS*pS*pA, (1-pA)*(1-pS)*(1-pS)+2*pA*pS*(1-pS)+pA*(1-pS)*(1-pS)] %last one pcc limited capacity
%b 
% pi*P = pi
% pi0+pi1+pi2 = 1

A = [P'-eye(3);1 1 1];
b = [0;0;0;1];
sol = A\b

%c
% P(X=0) = pi0 =sol(1)
sol_c = sol(1)

%d P(X=2) = pi2 = sol(3)
sol_d = sol(3)

%e
% E(X) = sum_x=0..2(x*piX)=pi1+2*pi2
exp_X = sol(2) +2*sol(3)
sol_e = exp_X *24*60/2*0.25

