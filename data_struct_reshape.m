
% Assuming FL_task is your structure and dFF0 is the field
numElements = length(FL_task.dFF0);
for i = 1:numElements
    currentVector = FL_task.dFF0{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        FL_task.dFF0{i} = currentVector';
    end
end

% Assuming FL_task is your structure and lick is the field
numElements = length(FL_task.lick);
for i = 1:numElements
    currentVector = FL_task.lick{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        FL_task.lick{i} = currentVector';
    end
end

% Assuming FL_task is your structure and Trial_Onsets is the field
numElements = length(FL_task.Trial_Onsets);
for i = 1:numElements
    currentVector = FL_task.Trial_Onsets{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        FL_task.Trial_Onsets{i} = currentVector';
    end
end

% Assuming FL_task is your structure and Valve_Onsets is the field
numElements = length(FL_task.Valve_Onsets);
for i = 1:numElements
    currentVector = FL_task.Valve_Onsets{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        FL_task.Valve_Onsets{i} = currentVector';
    end
end

% Assuming FL_task is your structure and RT is the field
numElements = length(FL_task.RT);
for i = 1:numElements
    currentVector = FL_task.RT{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        FL_task.RT{i} = currentVector';
    end
end

%% correct WD sessions

% Assuming WD_task is your structure and dFF0 is the field
numElements = length(WD_task.dFF0);
for i = 1:numElements
    currentVector = WD_task.dFF0{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        WD_task.dFF0{i} = currentVector';
    end
end

% Assuming WD_task is your structure and lick is the field
numElements = length(WD_task.lick);
for i = 1:numElements
    currentVector = WD_task.lick{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        WD_task.lick{i} = currentVector';
    end
end

% Assuming WD_task is your structure and Trial_Onsets is the field
numElements = length(WD_task.Trial_Onsets);
for i = 1:numElements
    currentVector = WD_task.Trial_Onsets{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        WD_task.Trial_Onsets{i} = currentVector';
    end
end

% Assuming WD_task is your structure and Valve_Onsets is the field
numElements = length(WD_task.Valve_Onsets);
for i = 1:numElements
    currentVector = WD_task.Valve_Onsets{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        WD_task.Valve_Onsets{i} = currentVector';
    end
end

% Assuming WD_task is your structure and RT is the field
numElements = length(WD_task.RT);
for i = 1:numElements
    currentVector = WD_task.RT{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        WD_task.RT{i} = currentVector';
    end
end

%% correct DT sessions

% Assuming DT_task is your structure and dFF0 is the field
numElements = length(DT_task.dFF0);
for i = 1:numElements
    currentVector = DT_task.dFF0{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        DT_task.dFF0{i} = currentVector';
    end
end

% Assuming DT_task is your structure and lick is the field
numElements = length(DT_task.lick);
for i = 1:numElements
    currentVector = DT_task.lick{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        DT_task.lick{i} = currentVector';
    end
end

% Assuming DT_task is your structure and Trial_Onsets is the field
numElements = length(DT_task.Trial_Onsets);
for i = 1:numElements
    currentVector = DT_task.Trial_Onsets{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        DT_task.Trial_Onsets{i} = currentVector';
    end
end

% Assuming DT_task is your structure and Valve_Onsets is the field
numElements = length(DT_task.Valve_Onsets);
for i = 1:numElements
    currentVector = DT_task.Valve_Onsets{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        DT_task.Valve_Onsets{i} = currentVector';
    end
end

% Assuming DT_task is your structure and RT is the field
numElements = length(DT_task.RT);
for i = 1:numElements
    currentVector = DT_task.RT{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        DT_task.RT{i} = currentVector';
    end
end

% Assuming DT_task is your structure and dFF0 is the field
numElements = length(DT_task.dFF0);
for i = 1:numElements
    currentVector = DT_task.dFF0{i};
    % Check if it's a vector of doubles
    if isa(currentVector, 'double')
        DT_task.dFF0{i} = single(currentVector);
    end
end

% Assuming DT_task is your structure and dFF0 is the field
numElements = length(DT_task.lick);
for i = 1:numElements
    currentVector = DT_task.lick{i};
    % Check if it's a vector of doubles
    if isa(currentVector, 'double')
        DT_task.lick{i} = single(currentVector);
    end
end

%% correct RO sessions


% Assuming RO_task is your structure and dFF0 is the field
numElements = length(RO_task.dFF0);
for i = 1:numElements
    currentVector = RO_task.dFF0{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        RO_task.dFF0{i} = currentVector';
    end
end

% Assuming RO_task is your structure and lick is the field
numElements = length(RO_task.lick);
for i = 1:numElements
    currentVector = RO_task.lick{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        RO_task.lick{i} = currentVector';
    end
end

% Assuming RO_task is your structure and Trial_Onsets is the field
numElements = length(RO_task.Trial_Onsets);
for i = 1:numElements
    currentVector = RO_task.Trial_Onsets{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        RO_task.Trial_Onsets{i} = currentVector';
    end
end

% Assuming RO_task is your structure and Valve_Onsets is the field
numElements = length(RO_task.Valve_Onsets);
for i = 1:numElements
    currentVector = RO_task.Valve_Onsets{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        RO_task.Valve_Onsets{i} = currentVector';
    end
end

% Assuming RO_task is your structure and RT is the field
numElements = length(RO_task.RT);
for i = 1:numElements
    currentVector = RO_task.RT{i};
    % Check if it's a row vector
    if size(currentVector, 1) == 1
        RO_task.RT{i} = currentVector';
    end
end

% Assuming RO_task is your structure and dFF0 is the field
numElements = length(RO_task.dFF0);
for i = 1:numElements
    currentVector = RO_task.dFF0{i};
    % Check if it's a vector of doubles
    if isa(currentVector, 'double')
        RO_task.dFF0{i} = single(currentVector);
    end
end

% Assuming RO_task is your structure and dFF0 is the field
numElements = length(RO_task.lick);
for i = 1:numElements
    currentVector = RO_task.lick{i};
    % Check if it's a vector of doubles
    if isa(currentVector, 'double')
        RO_task.lick{i} = single(currentVector);
    end
end