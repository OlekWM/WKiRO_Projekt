function [ binaryClass ] = class2CE( class )
% Na podstawie og�lnej klasy class zwraca klas� binarn� C lub E,
% ewenutalnie pusty znak, gdy nie da si� zakwalifikowa�.
if class == 'C'
    binaryClass = 'C';
elseif class == 'E'
    binaryClass = 'E';
else
    binaryClass = '';
end

