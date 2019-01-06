 %simulate a Poisson counting process
 %[0, Tmax] segment
 clear all;
 lambda = input('arrival rate=');
 Tmax = input('maximum time=');
 arr_time = -1/lambda * log(rand); %array of arrival times, Exp(lambda) distr
 
 last_arrival = arr_time;

 while last_arrival <= Tmax
     last_arrival = last_arrival - 1/lambda * log(rand);
     arr_time = [arr_time, last_arrival];
 end

arr_time = arr_time(1:end-1); %last last_arrival should not be included

%illustration
t = 0:0.01:Tmax;
Nsteps = length(t);
X = zeros(1, Nsteps);
for s=1:Nsteps
    X(s) = sum(arr_time <= t(s)); %nr of arrivals by time t(s)
end
axis([0 Tmax 0 max(X)]);
hold on
title('Poisson Counting Process');
xlabel('time');
ylabel('nr of arrivals');
comet(t,X);
    