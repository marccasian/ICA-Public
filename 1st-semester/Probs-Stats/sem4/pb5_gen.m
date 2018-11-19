% sim probl5 sem4 b c
% b
Nm = input('Length of samplepath =');
N = input('Number of simulaton =');
inundatii = 0;
sunnyd = 0;
for j = 1:N
    P0 = [0.2 0.8]; % initial distr of sunny/rainy
    P = [0.7 0.3; 0.4 0.6]; % trans prob matrix
    P1(1, :) = P0; % contains the forecast in day t=1
    for t = 1:Nm
        U = rand;
        X(t) = 1 * (U < P0(1)) + 2 * ( U >= P0(1)); % generate X(T) as a Bern(P0(1))
        P1(t+1, : ) = P1(t, :) * P; % Pt+1 =Pt * P the forecast for next day
        P0=P(X(t), :);
    end
    
    % c
    % Find long streaks of sunny / rainny days
    ichange = [find(X(1:end-1)~=X(2:end)), Nm]; % indices where states change
    % longstr a vector of long streaks of sunny or rainy
    longstr(1) = ichange(1);
    for i = 2:length(ichange)
        longstr(i) = ichange(i) - ichange(i-1);
    end
    %fprintf('\n streaks of sunny/rainy:\n')
    %fprintf(num2str(longstr))
    %X
    if X(1) == 1
        sunny  = longstr(1:2:end);
        rainy  = longstr(2:2:end);
    else
        rainy  = longstr(1:2:end);
        sunny  = longstr(2:1:end);
    end
    maxs(j) = max(sunny);
    maxr(j) = max(rainy);
%    if max(rainy) >= 7
%        inundatii = inundatii +1;
%    end
%    if max(sunny) >= 7
%        sunnyd = sunnyd +1;
%    end
end
fprintf('\n Prob of water shortage is %1.4f\n', mean(maxs>=7));
fprintf('\n Prob of flooding is %1.4f\n', mean(maxr>=7));
%probinundatie = inundatii / N
%ProbSeceta = sunnyd / N
