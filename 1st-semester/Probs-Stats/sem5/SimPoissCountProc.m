% Simulate a poisson counting process
lambda = input('arrival rate = ');
tmax = input('t max = ');

% array of arrival times
% exp(lambda) distributed
arr_time = -1/lambda * log(rand);          
                                  
last_arrival = arr_time;
while last_arrival <= tmax
    last_arrival = last_arrival - 1/lambda * log(rand);
    arr_time = [arr_time, last_arrival];
end

% last arrival time should not be included
arr_time = arr_time(1:end-1);

% illustration
t = 0:0.01:tmax;
Nsteps = length(t);
X = zeros(1, Nsteps);
for s=1:Nsteps
    X(s) = sum(arr_time <= t(s)); % number of arrivals by time t(s0
end

axis([0 tmax 0 max(X)]); % alocate the box for the graph

hold on

title('Poisson counting process');
xlabel('time');
ylabel('number of arrivals');

comet(t, X);

hold off
