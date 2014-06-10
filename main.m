function [ output ] = main( filename, wndSize, limit )
% Testowa g��wna funkcja, parametry wyj�ciowe testowo ustalane, �eby
% zobaczy� na aktualny etapie projektu

filename = 'CB396_dssp.txt';
wndSize = 7;
limit = 10;

% Wczytanie bia�ek z pliku
disp('Wczytywanie danych');
proteins = loadProteins(filename);

% Utworzenie pr�bek o zadanym rozmiarze okna (pr�bka -> klasa)
disp('Tworzenie pr�bek dla rozmiaru okna');
limit = min(limit, length(proteins));
samples = proteins2Samples(proteins(1:limit), wndSize);

% Podzia� na zbi�r treningowy i testowy
samples = shuffleSamples(samples);
[training, validation, test] = splitSamples(samples, [2 1 1]);

gamma = 0.1;
c = 1.5;

fprintf('Testowanie dla gamma=%d, c=%d\n', gamma, c);
[ validationResults, testResults ] = train(training, validation, test, gamma, c);

output = [ validationResults; testResults ];
end

