function [ shuffled ] = shuffleSamples( samples )
% Tworzy losow¹ permutacjê próbek.
len = length(samples(:, 1));
perm = randperm(len);
shuffled = samples(perm, :);
end

