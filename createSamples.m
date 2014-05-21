function [ samples ] = createSamples( protein, secondLvlStruct, wndSize )
% Wyznacza zbiór próbek o zadanym rozmiarze okna (ci¹g aminokwasów w
% liczbie odpowiadaj¹cej rozmiarowi okna mapowany na jeden element
% struktury drugorzêdowej.
%
% protein - bia³ko (ci¹g aminokwasów)
% secondLvlStruct - drugorzêdowa struktura danego bia³ka
% wndSize - rozmiar okna
% samples - ka¿dy wiersz to próbka - ci¹g aminokwasów z okna oraz element
% drugorzêdowej struktury

len = length(protein);

for i = 1 : len
    aminoVector = createWindow(protein, i, wndSize);
    
    aminoVector = protein2FeatureVector(aminoVector); % Zakomentowaæ, jeœli chcemy widzieæ próbki w formie tekstowej
    
    samples{i,1} = aminoVector;
    samples{i,2} = secondLvlStruct(i);
end
end