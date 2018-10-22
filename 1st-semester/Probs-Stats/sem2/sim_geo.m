% Simulate Geo(p) distrib

clear all

p = input('p(in(0,1))='); % par
N = input('nr of simulations='); % par

for i=1:N
    X(i) = 0;
    while rand >= p % count nr of failures
        X(i) = X(i) + 1;
    end;
end;

% compare it to the Geo(n, p) distr graphically

UX = unique(X);
nX = hist(X, length(UX));
rel_freq = nX/N;

k = 0:50; % geometric distr as a infinite nr of values
pk = geopdf(k,p); % true Geo(n, p)
clf
plot(k, pk, '*', UX, rel_freq, 'ro')
legend('Geo distr', 'Simulation')