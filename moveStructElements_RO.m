% Desired index to insert after
insertAfterIndex = 25;

% Get all field names of the structure
fields = fieldnames(RO_task);

for i = 1:length(fields)
    field = fields{i};
    
    % Insert an empty cell at the desired location
    RO_task.(field)(end+1) = {[]}; % Increase the length by 1
    RO_task.(field)(insertAfterIndex+2:end) = RO_task.(field)(insertAfterIndex+1:end-1); % Shift the data by one position
end

% Now add the new data at the desired position
RO_task.mice_NO{insertAfterIndex + 1} = 'JH111';
RO_task.behavior_data{insertAfterIndex + 1} = bdata;
RO_task.dFF0{insertAfterIndex + 1} = dFF;
RO_task.lick{insertAfterIndex + 1} = chlick;
RO_task.Trial_Onsets{insertAfterIndex + 1} = TrialOnsets;
RO_task.Valve_Onsets{insertAfterIndex + 1} = ValveOnsets;
RO_task.RT{insertAfterIndex + 1} = RT;

% Clearing other variables to retain only RO_task in the workspace
clearvars -except RO_task
