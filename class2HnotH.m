function [ binaryClass ] = class2HnotH( class )
% Na podstawie og�lnej klasy class zwraca klas� binarn� H lub ~H
if class == 'H'
    binaryClass = 'H';
else
    binaryClass = '~H';
end
