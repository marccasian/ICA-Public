% Simulate a binomial counting process
Nb = input('size of sample path = ');
p = input('probability of arrival = ');

X = zeros(1, Nb);
X(1) = (rand < p);
for t=2:Nb
    X(t) = X(t-1) + (rand<p); %count the number of successes
end

Del = input('frame size = ');
axis([0 Nb 0 max(X)]); % alocate the box for the graph

hold on

title('Binomial counting process');
xlabel('time');
ylabel('number of arrivals');

for t = 1:Nb
    plot(t, X(t), '*', 'MarkerSize', 8);
    pause(Del);
end;

hold off
