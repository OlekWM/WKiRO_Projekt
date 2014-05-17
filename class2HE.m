function [ binaryClass ] = class2HE( class )
% Na podstawie ogólnej klasy class zwraca klasê binarn¹ H lub E,
% ewenutalnie pusty znak, gdy nie da siê zakwalifikowaæ.
if class == 'H'
    binaryClass = 'H'
elseif class == 'E'
    binaryClass = 'E';
else
    binaryClass = '';
end

