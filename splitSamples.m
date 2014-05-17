function [ set1 set2 ] = splitSamples( samples, ratio )
% Dzieli zbiór próbek na dwa podzbiory o odpowiednim stosunku.
%
% ratio - wspó³czynnik podzia³u

len = length(samples(:,1));
set1Count = ceil(ratio * len);

set1 = samples(1 : set1Count, :);
set2 = samples(set1Count + 1 : end, :);
end

