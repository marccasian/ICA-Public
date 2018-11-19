% Xt the nr of concurent users at time t (in minutes)
% sh process
% 3 states:
% 0,1 or 2 user at same time

%a)
%       [A0]    [p00 p01 p02]
% P =   [A1] =  [p10 p11 p12]
%       [A2]    [p20 p21 p22]
%
% A0: Bino(n=2, p=0.2)
%
A0 = binopdf(0:2,2,0.2);

%p10 the connected user disconects and the disconected user doesn't connect
%p11 1 - p10 - p12
%p12 the connected user doesn't disconect and the disconected user connects
A1 = [0.5*0.8 0.5 0.5*0.2];

% A1: Bino (n=2, p=0.5)
A2 = binopdf(2:-1:0,2,0.5);

P = [A0; A1; A2]

%b)
% 10:00 a.m
% P0 = [0 0 1]
% 10:02 t=2
P0 = [ 0 0 1 ];
P2 = P0*(P^2);
answB = P2(2)

%c) t = 120
% st state distrib
A = [P' - eye(3); [1 1 1]];
b = [0;0;0;1];
pi = A\b;

% mean value
ansC = [0 1 2]* pi

