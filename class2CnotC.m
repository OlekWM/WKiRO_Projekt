function [ binaryClass ] = class2CnotC( class )
% Na podstawie ogólnej klasy class zwraca klasê binarn¹ C lub ~C
if class == 'C'
    binaryClass = 'C'
else
    binaryClass = '~C';
end

