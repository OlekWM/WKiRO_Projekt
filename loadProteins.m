function [ proteins ] = loadProteins( filename )
%LOADPROTEINS £aduje dane o bia³kach
% W ka¿dym wierszu znajduje siê pierwszorzêdowa struktura oraz
% drugorzêdowa.
lines = textread(filename, '%s', 'whitespace','\b\t');
lines = stripNonRelevant(lines);
proteins = format(lines);
end



function [ formatted ] = format ( lines )
% £¹czy kolejne linie w jedn¹, dopóki s¹ zakoñczone znakiem równoœci
% Wyniki umieszcza w parach (w dwóch kolumnach).
len = length(lines);
j = 1;
k = 1;
result = {};
col = 1;
for i=1:len
    line = lines(i);
    temp = cell2mat(line);
    result{j, col} = line;
    j = j + 1;
    
    if temp(length(temp)) ~= '='
        if col == 2
            r1 = mergeLines(result(:, 1));
            r2 = mergeLines(result(:, 2));
            formatted{k, 1} = r1;
            formatted{k, 2} = r2;
            k = k + 1;
            result = [];
        end
        j = 1;
        col = 3 - col;
    end
end
end

function [ merged ] = mergeLines ( lines )
len = length(lines);
merged = char.empty;
for i = 1 : len
    mat = cell2mat(lines{i});
    mat_len = length(mat);
    
    if i < len
        mat_len = mat_len - 1;
    end
    
    if mat_len < 1
        break;
    end
    
    start = length(merged) + 1;
    stop = start + mat_len - 1;
    merged(start : stop) = mat(1 : mat_len);
end
end

function [ samples ] = stripNonRelevant ( lines )
% Wycina nieistotne linie, pozostawiaj¹c jedynie dane o bia³kach
len = length(lines);
j = 1;
for i=1:len
    temp = cell2mat(lines(i));
    if temp(1) ~= '>'
        samples(j) = lines(i);
        j = j + 1;
    end
end
end