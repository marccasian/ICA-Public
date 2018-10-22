% Simulate Bino(n,p) distrib

n = input('nr of trials (in N)='); % par
p = input('p(in(0,1))='); % par

U = rand(n, 1);
X= sum(U < p);  

N = input('number of simulations='); % size of the Monte Carlo Study try 10,1e3,1e5
for i=1:N
    U = rand(n, 1);
    X(i)=sum(U<p);
end;

% compare it to the Bino(n, p) distr graphically

UX = unique(X);
nX = hist(X, length(UX));
rel_freq = nX/N;

k = 0:n;
pk = binopdf(k,n,p); % true Bino(n, p)
clf
plot(k, pk, '*', UX, rel_freq, 'ro')
legend('Bino distr', 'Simulation')