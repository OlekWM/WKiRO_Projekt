function [ shuffled ] = shuffleSamples( samples )
% Miesza pr�bki :)
len = length(samples(:, 1));
perm = randperm(len);
shuffled = samples(perm, :);
end

