% Simulate Nbin(p) distrib

clear all

n = input('rank of the success (in N)='); % par
p = input('p(in(0,1))='); % par
N = input('number of simulations='); % par

for i=1:N
    for j=1:n
        Y(j) = 0;
        while rand >= p % count nr of failures
            Y(j) = Y(j) + 1;
        end;
    end;
    X(i) = sum(Y);
end;
% compare it to the Geo(n, p) distr graphically

UX = unique(X);
nX = hist(X, length(UX));
rel_freq = nX/N;

k = 0:50; % NBin distr as a infinite nr of values
pk = nbinpdf(k,n,p); % true NBin(n, p)
clf
plot(k, pk, '*', UX, rel_freq, 'ro')
legend('NBin distr', 'Simulation')