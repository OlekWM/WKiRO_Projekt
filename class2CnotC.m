function [ binaryClass ] = class2CnotC( class )
% Na podstawie og�lnej klasy class zwraca klas� binarn� C lub ~C
if class == 'C'
    binaryClass = 'C'
else
    binaryClass = '~C';
end

