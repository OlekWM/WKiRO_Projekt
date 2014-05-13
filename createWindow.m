function [ window ] = createWindow( protein, index, wndSize )
% Zwraca ci¹g aminokwasów - okno - dla danego bia³ka na zadanej pozycji o
% zadanym rozmiarze.
% Jeœli okna wykracza poza granicê bia³ka, to jest ono dope³niane
% aminokwasem pocz¹tkowym/koñcowym bia³ka.
%
% protein - bia³ko dla którego bêdzie wyznaczane okno
% index - pozycja aminokwasu, na którym bêdzie wycentrowane okno
% wndSize - rozmiar okna

len = length(protein);
% Liczba elementów po prawej/lewej stronie centralnego elementu okna.
delta = floor(wndSize / 2);

% Tworzymy pomocnicze bia³ko, dope³nione po obu stronach
% pocz¹tkowym/koñcowym aminokwasem. Liczba dodanych aminokwasów odpowiada
% liczbie aminokwasów o ile maksymalnie okno mo¿e wyjœæ poza granice
% bia³ka.
temp1(1:delta) = protein(1);
temp2(1:delta) = protein(end);
helpProtein = [ temp1, protein, temp2 ];

% Nowy indeks w pomocniczym bia³ku.
index = index + delta;
% Wyznaczamy zakres aminokwasów, które kopiujemy z pomocniczego bia³ka.
start = index - delta;
stop = index + delta;

window = helpProtein(start : stop);
end