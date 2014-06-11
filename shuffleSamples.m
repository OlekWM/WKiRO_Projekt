function [ shuffled ] = shuffleSamples( samples )
% Tworzy losow� permutacj� pr�bek.
len = length(samples(:, 1));
perm = randperm(len);
shuffled = samples(perm, :);
end

