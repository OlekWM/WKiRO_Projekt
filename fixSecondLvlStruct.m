function [ fixed ] = fixSecondLvlStruct( arg )
%Zamienia myœlniki na trzeci element struktury
%drugorzêdowej ('-' -> 'C')

len = length(arg);
for i = 1 : len
    if arg(i) == '-'
        arg(i) = 'C';
    end
end
fixed = arg;
end

