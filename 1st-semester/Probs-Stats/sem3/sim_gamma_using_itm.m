%Sim.Gam(a ,lam) using ITM (invers transf method)
a = input('a(a pos integer)='); % param
lam = input('lam(>0)='); % param

err = input('err='); % 1e-2, 1e-3
alpha = input('alpha(level of significance, in(0,1))='); % 0.05 , 0.01\
N = ceil(0.25 * (norminv(alpha/2, 0, 1)/err)^2); % size of MC study
X = 0;
for i=1:N
    X(i) = sum(-lam * log(rand(a, 1)));
end;

fprintf('N= %7d\n', N)

% compare graphically

x = -0.1:0.01:-a*lam * log(lam * err); % gam distr as a infinite nr of values
xcdf = gamcdf(x,a,lam); % true gam(x, a, lam)

mysim = 0;
for j=1:length(x)
    mysim(j) = mean(X < x(j));
end;

clf
plot(x, xcdf, x, mysim,'r:')
legend('cdf of Gam', 'Simulation')