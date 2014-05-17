function [ shuffled ] = shuffleSamples( samples )
% Miesza próbki :)
len = length(samples(:, 1));
perm = randperm(len);
shuffled = samples(perm, :);
end

