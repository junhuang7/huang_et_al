vectorA = TraceTrlh(1,:);
vectorB = TraceTrl_RTh(1,:);

lenA = length(vectorA);
lenB = length(vectorB);

maxLen = 0; % Length of longest common subsequence
startA = 0; % Starting index in vectorA of longest common subsequence
startB = 0; % Starting index in vectorB of longest common subsequence

for i = 1:lenA
    for j = 1:lenB
        k = 0;
        while (i+k <= lenA) && (j+k <= lenB) && (vectorA(i+k) == vectorB(j+k))
            k = k + 1;
        end
        if k > maxLen
            maxLen = k;
            startA = i;
            startB = j;
        end
    end
end

% Report the first element index of the matching sequence in both vectors
if maxLen > 0
    disp(['The longest common subsequence starts at index ', num2str(startA), ' in vectorA and index ', num2str(startB), ' in vectorB.']);
else
    disp('No common subsequence found.');
end

% Adjust vectors for alignment
if startA > startB
    padding = NaN(1, startA - startB);
    vectorB = [padding, vectorB];
else
    padding = NaN(1, startB - startA);
    vectorA = [padding, vectorA];
end

RT_resc = startA-startB + 2000;

% Plot the vectors
% figure;
% hold on;
% plot(vectorA, 'r', 'DisplayName', 'Vector A');
% plot(vectorB, 'b', 'DisplayName', 'Vector B');
% 
% % Plot the common subsequence in green
% if maxLen > 0
%     commonSeqA = NaN(size(vectorA));
%     commonSeqB = NaN(size(vectorB));
%     
%     commonSeqA(startA:startA+maxLen-1) = vectorA(startA:startA+maxLen-1);
%     commonSeqB(startB:startB+maxLen-1) = vectorB(startB:startB+maxLen-1);
%     
%     plot(commonSeqA, 'g', 'LineWidth', 2, 'DisplayName', 'Common Sequence');
%     plot(commonSeqB, 'g', 'LineWidth', 2);
% end
% 
% legend();
% hold off;
