function [ binaryClass ] = class2CE( class )
% Na podstawie og�lnej klasy class zwraca klas� binarn� C lub E,
% ewenutalnie pusty znak, gdy nie da si� zakwalifikowa�.
if class == 'C'
    %binaryClass = 'C';
    binaryClass = 1;
elseif class == 'E'
    %binaryClass = 'E';
    binaryClass = 0;
else
    %binaryClass = '';
    binaryClass = -1;
end

