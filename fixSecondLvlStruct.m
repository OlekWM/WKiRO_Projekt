function [ fixed ] = fixSecondLvlStruct( arg )
%Zamienia my�lniki na trzeci element struktury
%drugorz�dowej ('-' -> 'C')

len = length(arg);
for i = 1 : len
    if arg(i) == '-'
        arg(i) = 'C';
    end
end
fixed = arg;
end

