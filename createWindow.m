function [ window ] = createWindow( protein, index, wndSize )
% Zwraca ci�g aminokwas�w - okno - dla danego bia�ka na zadanej pozycji o
% zadanym rozmiarze.
% Je�li okna wykracza poza granic� bia�ka, to jest ono dope�niane
% aminokwasem pocz�tkowym/ko�cowym bia�ka.
%
% protein - bia�ko dla kt�rego b�dzie wyznaczane okno
% index - pozycja aminokwasu, na kt�rym b�dzie wycentrowane okno
% wndSize - rozmiar okna

len = length(protein);
% Liczba element�w po prawej/lewej stronie centralnego elementu okna.
delta = floor(wndSize / 2);

% Tworzymy pomocnicze bia�ko, dope�nione po obu stronach
% pocz�tkowym/ko�cowym aminokwasem. Liczba dodanych aminokwas�w odpowiada
% liczbie aminokwas�w o ile maksymalnie okno mo�e wyj�� poza granice
% bia�ka.
temp1(1:delta) = protein(1);
temp2(1:delta) = protein(end);
helpProtein = [ temp1, protein, temp2 ];

% Nowy indeks w pomocniczym bia�ku.
index = index + delta;
% Wyznaczamy zakres aminokwas�w, kt�re kopiujemy z pomocniczego bia�ka.
start = index - delta;
stop = index + delta;

window = helpProtein(start : stop);
end