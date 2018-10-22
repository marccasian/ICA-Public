% Simulate Bern(p) distrib

p = input('p(in(0,1))='); % par
U = rand;
X=(U < p);  % X = 1 if U < p ("success")
            % X = 0 otherwise
            
N = input('number of simulations='); % size of the Monte Carlo Study try 10,1e3,1e5
for i=1:N
    U = rand;
    X(i)=(U<p);
end;

% compare it to the Bern(p) distr

UX = unique(X)
nX = hist(X, length(UX));
rel_freq = nX/N