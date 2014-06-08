function [ binaryClass ] = class2HnotH( class )
% Na podstawie ogólnej klasy class zwraca klasê binarn¹ H lub ~H
if class == 'H'
    %binaryClass = 'H';
    binaryClass = 1;
else
    %binaryClass = '~H';
    binaryClass = 0;
end
