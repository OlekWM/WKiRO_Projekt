function [ binaryClass ] = class2HE( class )
% Na podstawie og�lnej klasy class zwraca klas� binarn� H lub E,
% ewenutalnie pusty znak, gdy nie da si� zakwalifikowa�.
if class == 'H'
    binaryClass = 'H'
elseif class == 'E'
    binaryClass = 'E';
else
    binaryClass = '';
end

