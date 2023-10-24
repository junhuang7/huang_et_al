clear 
clc
cd D:\huang_et_al\data_struct
load('RO_task_data_struct_single.mat')
cd E:\dLight\processed_data\temp_dual
files = dir('E:\dLight\processed_data\temp_dual\*.mat');

% Define the sess_index values you provided
%sess_indices = [37:44, 61:66]; % for FL task
%sess_indices = [55:66, 91:99]; % for WD task
%sess_indices = [49:60, 76:81]; % for DT task
sess_indices = [17:20, 27:28]; % for RO task
fileIndex = 1;

for file = files'
    % Use matfile to create an object that allows access to the file
    matObj = matfile(file.name);
    
    % Access the required variables from the .mat file
    ValveOnsets = matObj.ValveOnsets;
    TrialOnsets = matObj.TrialOnsets;
    hit = matObj.hit;
    TrialOnsets_NO = matObj.TrialOnsets_NO;
    
    % Process the data
    RT_valve = ValveOnsets - TrialOnsets(hit);
    ValveOnsets_new = TrialOnsets_NO(hit) / 1000 + RT_valve;
    RO_task.Trial_Onsets{sess_indices(fileIndex)} = TrialOnsets_NO / 1000;
    RO_task.Valve_Onsets{sess_indices(fileIndex)} = ValveOnsets_new;
    fileIndex = fileIndex + 1;
end
clear files sess_indices fileIndex RT_valve ValveOnsets_new ValveOnsets TrialOnsets TrialOnsets_NO
