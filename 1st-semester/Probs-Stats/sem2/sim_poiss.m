% Simulate Poiss(l) distrib

clear all

l = input('lambda (>0)='); % par
N = input('number of simulations='); % par

for j=1:N
    U = rand;
    i=0;
    F(j) = exp(-l);
    while U >= F(j)
        i = i + 1;
        F(j) = F(j)+exp(-l)*l^i/gamma(i+1);
    end;
    X(j)=i;
end;
% compare it to the Poiss(l) distr graphically

UX = unique(X);
nX = hist(X, length(UX));
rel_freq = nX/N;

k = 0:50; % NBin distr as a infinite nr of values
pk = poisspdf(k,l); % true Poiss(n, p)
clf
plot(k, pk, '*', UX, rel_freq, 'ro')
legend('Poiss distr', 'Simulation')