%Sim.Poiss(lam) using ITM (invers transf method)
lam = input('lam(>0)='); % param

err = input('err='); % 1e-2, 1e-3
alpha = input('alpha(level of significance, in(0,1))='); % 0.05 , 0.01\
N = ceil(0.25 * (norminv(alpha/2, 0, 1)/err)^2); % size of MC study
X = 0;
for i=1:N
    x = 0; % initial value
    U=rand;
    while U > exp(-lam) % U1 U2 .. Uk >= exp(-lam)
        U = U*rand;
        x = x + 1;
    end;
    X(i) = x;
end;

fprintf('N= %7d\n', N)

% compare graphically

k = 0:50; % poiss distr as a infinite nr of values
pk = poisspdf(k,lam); % true Poiss(n, p)

UX = unique(X);
nX = hist(X, length(UX));
clf
plot(k, pk, '*', UX, nX/N, 'ro')
legend('Poiss dstr', 'Simulation')