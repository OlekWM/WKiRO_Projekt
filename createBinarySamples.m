function [ binarySamples ] = createBinarySamples( samples, classFunction )
% Tworzy pr�bki dla binarnego klasyfikatora. Do wyznaczenia klasy binarnej
% stosuje przekazan� funkcj�. Je�li funckja zwraca pust� klas�, to dana
% pr�bka jest pomijana.

samplesCount = length(samples(:,1));
j = 1;

for i = 1 : samplesCount
    generalClass = samples(i, 2);
    binaryClass = classFunction(cell2mat(generalClass));
    
    if isempty(binaryClass)
        continue;
    end
    
    binarySamples(j, 1) = samples(i, 1);
    binarySamples(j, 2) = mat2cell(binaryClass);
    j = j + 1;
end
end

