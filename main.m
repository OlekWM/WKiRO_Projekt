function [ output ] = main( filename, wndSize, limit )
% Testowa g³ówna funkcja, parametry wyjœciowe testowo ustalane, ¿eby
% zobaczyæ na aktualny etapie projektu

filename = 'CB396_dssp.txt';

% Treningowy : walidacyjny : testowy
proportions = [ 2, 1, 1];
limit = 10;

wndSize = [ 7, 9 ];
c = [ 1, 1.5 ];
gamma = [ 0.1 ];

% Wczytanie bia³ek z pliku
disp('Wczytywanie danych');
proteins = loadProteins(filename);
limit = min(limit, length(proteins));

wndCount = length(wndSize);
cCount = length(c);
gammaCount = length(gamma);

for i = 1 : wndCount
    % Utworzenie próbek o zadanym rozmiarze okna (próbka -> klasa)
    fprintf('Tworzenie próbek dla rozmiaru okna %d', wndSize(i));
    samples = proteins2Samples(proteins(1:limit), wndSize);
    
    % Podzia³ na zbiór treningowy walidacyjny i testowy
    %samples = shuffleSamples(samples);
    [training, validation, test] = splitSamples(samples, proportions);
    
    for j = 1 : gammaCount
        for k = 1 : cCount
            index = 2 * (i - 1) * (gammaCount * cCount) + 2 * (j - 1) * cCount + 2 * k;
            
            fprintf('Testowanie dla gamma=%d, c=%d\n', gamma(j), c(k));
            [ validationResults, testResults ] = train(training, validation, test, gamma(j), c(k));
            results(index - 1, :) = [ wndSize(i), gamma(j), c(k), validationResults];
            results(index, :) = [ wndSize(i), gamma(j), c(k), testResults];
        end
    end
end

output = results;
end

