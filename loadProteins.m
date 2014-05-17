function [ proteins ] = loadProteins( filename )
%LOADPROTEINS £aduje dane o bia³kach
% W ka¿dym wierszu znajduje siê pierwszorzêdowa struktura oraz
% drugorzêdowa.
lines = textread(filename, '%s', 'whitespace','\b\t');
parts = split(lines);
partsCount = length(parts);

for i=1:partsCount
    proteins{i} = format(parts{i});
end
end



function [ formatted ] = format ( lines )
% lines - kolejne linie bia³ka (jego podstawowej struktury i drugorzêdowej)
% zwraca dwie kolumny - pierwszorzêdow¹ strukturê, oraz drugorzêdow¹
len = length(lines);
halfLen = len / 2;
lvl1 = lines(1 : halfLen);
lvl2 = lines(halfLen + 1 : end);
formatted{1} = mergeLines(lvl1);
formatted{2} = mergeLines(lvl2);
end

function [ merged ] = mergeLines ( lines )
len = length(lines);
merged = char.empty;
for i = 1 : len
    mat = cell2mat(lines(i));
    mat_len = length(mat);
    
    if(mat(end)) == '='
        mat_len = mat_len - 1;
    end
    
    start = length(merged) + 1;
    stop = start + mat_len - 1;
    merged(start : stop) = mat(1 : mat_len);
end
end

function [ parts ] = split ( lines )
% Wycina nieistotne linie wydzielaj¹c jednoczeœnie kolejne bia³ka z ich
% mapowaniami.
% parts - tablica komórek, gdzie ka¿da komórka odpowiada jednemu bia³ku -
% zawiera tablicê z liniami z pliku dla danego bia³ka (pierwszo i
% drugorzêdowa struktura.
len = length(lines);
part = 1;
j = 1;
for i=2:len
    temp = cell2mat(lines(i));
    if temp(1) == '>'
        parts{part} = sample;
        part = part + 1;
        j = 1;
        continue;
    end
    
    sample(j) = lines(i);
    j = j + 1;
end
parts{part} = sample;
end