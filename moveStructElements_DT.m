% Desired index to insert after
insertAfterIndex = 75;

% Get all field names of the structure
fields = fieldnames(DT_task);

for i = 1:length(fields)
    field = fields{i};
    
    % Insert an empty cell at the desired location
    DT_task.(field)(end+1) = {[]}; % Increase the length by 1
    DT_task.(field)(insertAfterIndex+2:end) = DT_task.(field)(insertAfterIndex+1:end-1); % Shift the data by one position
end

% Now add the new data at the desired position
DT_task.mice_NO{insertAfterIndex + 1} = 'JH111';
DT_task.behavior_data{insertAfterIndex + 1} = bdata;
DT_task.dFF0{insertAfterIndex + 1} = dFF;
DT_task.lick{insertAfterIndex + 1} = chlick;
DT_task.Trial_Onsets{insertAfterIndex + 1} = TrialOnsets;
DT_task.Valve_Onsets{insertAfterIndex + 1} = ValveOnsets;
DT_task.RT{insertAfterIndex + 1} = RT;

% Clearing other variables to retain only DT_task in the workspace
clearvars -except DT_task
