function [ samples ] = createSamples( protein, secondLvlStruct, wndSize )
% Wyznacza zbi�r pr�bek o zadanym rozmiarze okna (ci�g aminokwas�w w
% liczbie odpowiadaj�cej rozmiarowi okna mapowany na jeden element
% struktury drugorz�dowej.
%
% protein - bia�ko (ci�g aminokwas�w)
% secondLvlStruct - drugorz�dowa struktura danego bia�ka
% wndSize - rozmiar okna
% samples - ka�dy wiersz to pr�bka - ci�g aminokwas�w z okna oraz element
% drugorz�dowej struktury

len = length(protein);

for i = 1 : len
    aminoVector = createWindow(protein, i, wndSize);
    
    aminoVector = protein2FeatureVector(aminoVector); % Zakomentowa�, je�li chcemy widzie� pr�bki w formie tekstowej
    
    samples{i,1} = aminoVector;
    samples{i,2} = secondLvlStruct(i);
end
end