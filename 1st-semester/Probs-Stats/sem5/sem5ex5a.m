 %simulate a binomial counting process
 clear all;
 Nb = input('size of sample path=');
 p = input('prob of a arrival(success)=');
 X = zeros(1,Nb);
 X(1) = (rand < p);
 for t=2:Nb %starts from 2 as matlab does not have de index 0
     X(t)= X(t-1) + (rand<p); %count number of successes(arrivals)
 end
X;

%illustration
Del = input('frame size(in seconds)=');
axis([0 Nb 0 max(X)]); %alocate the box for the graph
hold on
title('Binomial counting Process');
xlabel('time');
ylabel('nr of arrivals');
for t=1:Nb
    plot(t, X(t), '*',  "MarkerSize", 8) %we can use o + or v  but not .
    pause(Del)
end
hold off
    