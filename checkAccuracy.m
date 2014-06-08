function acc = checkAccuracy(result, expected)
% Funkcja wyliczaj¹ca dok³adnoœæ jako procent poprawnych przewidywañ

correct = 0;
testLength = length(expected);
for i = 1 : testLength
    if (cell2mat(expected(i)) == result(i))
        correct = correct + 1;
    end
end
acc = correct / testLength;

end