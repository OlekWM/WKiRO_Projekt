function [ binaryClass ] = class2HnotH( class )
% Na podstawie ogólnej klasy class zwraca klasê binarn¹ H lub ~H
if class == 'H'
    binaryClass = 'H';
else
    binaryClass = '~H';
end
