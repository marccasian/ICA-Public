%ex6 Simulation
% D/G/1 q.syst (Deterministic/Gamma/1)
miuA = 15;
T = miuA; %fixed interarrival time
lamA = 1/miuA;%min
% params for Gamma distrib (for service times)
alpha = 4;
lam = 10/3; % min^-1

N = input('size of the MC study=');

arr_times = 0:T:(N-1)*T; % arrivals 0, t,2t...
serv_start=zeros(1,N); % times when service starts
service=zeros(1,N); % how much the service takes
serv_finish = zeros(1,N); % times when service finishes
A = 0; %time when doctor becomes available
for j=1:N
    serv_start(j) = max(A, arr_times(j));
    %simulate GAmma (lam, alpha) as the sumof alpha Exp(1/lam) variables
    service(j) = -lam*sum(log(rand(alpha, 1)));
    serv_finish(j) = serv_start(j) + service(j);
    A = serv_finish(j);
end;

fprintf('a) Expected response time E(R) is %3.5f\n', mean(serv_finish-arr_times))
fprintf('b) Expected waiting time E(W) is %3.5f\n', mean(serv_start-arr_times))
fprintf('c) Probability that a patient has to wait before seeing a doctor P(W >0) is %3.5f\n', mean(serv_start>arr_times))
