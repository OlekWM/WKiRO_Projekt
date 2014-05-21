function [ binaryClass ] = class2CH( class )
% Na podstawie ogólnej klasy class zwraca klasê binarn¹ C lub H,
% ewenutalnie pusty znak, gdy nie da siê zakwalifikowaæ.
if class == 'C'
    binaryClass = 'C';
elseif class == 'H'
    binaryClass = 'H';
else
    binaryClass = '';
end

