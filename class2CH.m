function [ binaryClass ] = class2CH( class )
% Na podstawie og�lnej klasy class zwraca klas� binarn� C lub H,
% ewenutalnie pusty znak, gdy nie da si� zakwalifikowa�.
if class == 'C'
    binaryClass = 'C';
elseif class == 'H'
    binaryClass = 'H';
else
    binaryClass = '';
end

