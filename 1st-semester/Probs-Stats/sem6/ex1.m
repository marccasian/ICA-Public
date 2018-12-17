%ex1

%BSS
% 2 frames until 10:04 starting 10:00
delta = 2% min
lamA = 1/10%min
miuS = 6% min
lamS = 1/miuS %min
r = lamA/lamS 
pA = lamA * delta
pS = lamS*delta
P0 = [1 0 0]
firstRowP = [1-pA pA 0]
thirdColP = [0;pA*(1-pS);(1-pA)*(1-pS)+pA*pS]
pX2eq2orX0eq0 = firstRowP*thirdColP