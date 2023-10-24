% Assuming TraceTrl and TraceTrl_RTh are previously defined
numRows = size(TraceTrl, 1); % assuming both matrices have the same number of rows

RT_resc_values = zeros(1, numRows); % preallocate for efficiency

parfor row = 1:numRows
    vectorA = TraceTrl(row,:);
    vectorB = TraceTrl_RT(row,:);

    lenA = length(vectorA);
    lenB = length(vectorB);

    maxLen = 0; % Length of longest common subsequence
    startA = 0; % Starting index in vectorA of longest common subsequence
    startB = 0; % Starting index in vectorB of longest common subsequence

    for i = 1:lenA
        for j = 1:lenB
            if lenB - j + 1 < maxLen
                break; % Optimization: if the remaining length is less than maxLen, break early
            end
            
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

    % Calculate RT_resc for the current row
    RT_resc = startA - startB + 2000;
    
    % Store the RT_resc value
    RT_resc_values(row) = RT_resc;
end
RT_resc_values = RT_resc_values';
plot(RT-RT_resc_values)
%% RT_resc_values confirmed to be working
% Display the RT_resc values
% disp(RT_resc_values);

% plot(RT)
% hold on
% plot(RT_resc_values)
% 
% plot(RT-RT_resc_values)



