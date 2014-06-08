function [ binaryClass ] = class2CE( class )
% Na podstawie ogólnej klasy class zwraca klasê binarn¹ C lub E,
% ewenutalnie pusty znak, gdy nie da siê zakwalifikowaæ.
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

