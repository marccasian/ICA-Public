% problem 4
clear all;
err = input('err='); % 1e-2, 1e-3
alpha = input('alpha(level of significance, in(0,1))='); % 0.05 , 0.01\

N = ceil(0.25 * (norminv(alpha/2, 0, 1)/err)^2); % size of MC study
kdays = input('nr of previous days considered = ');
k = kdays;
inlast = input('nr of errors in the last kdays (vector of length kdays)=');
tmax = input('max timeafter which software os withdrawn (in days)=');

% Ttotal: the time it takes to find all errors
% Ntotalerr: total nr of errors

for j=1:N
    % T time from now on (in days)
    % X nr of errors on day T
    % nrerr nr of errors detected so far
    T = 0;
    X = inlast(k);
    nrerr = sum(inlast);
    last = inlast;
    while X > 0
        lam = min(last);
        U = rand;
        X = 0;
        while U > exp(-lam) % U1 U2 .. Uk >= exp(-lam)
            U = U*rand;
            X = X + 1;
        end;
        % update
        T = T + 1; % next day
        nrerr = nrerr  + X; %new nr of errors 
        last = [last(2:k), X];  
    end;
    Ttotal(j) =  T - 1;
    Ntotalerr(j) = nrerr;
end;

fprintf(' a) The time it will take to find all errors = %f\n', mean(Ttotal));
fprintf(' b) Total nr of errors in the new release = %f\n', mean(Ntotalerr));
fprintf(' c) Probability of sending back the software to developement = %f\n', mean(Ttotal > tmax));

