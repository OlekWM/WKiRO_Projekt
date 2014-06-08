function q = Qclass( result, expected, class )
% Wylicza miarê jakoœæ Q dla klasy (Qe, Qc, Qh)

correct = 0;
totalInClass = 0;
testLength = length(expected);
for i = 1 : testLength
    exp = cell2mat(expected(i));
    res = cell2mat(result(i));
    
    if(exp == class)
        totalInClass = totalInClass + 1;
        if(exp == res)
            correct = correct + 1;
        end
    end
end
q = [ correct/totalInClass, correct, totalInClass ];
end

