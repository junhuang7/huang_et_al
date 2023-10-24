for i = 2 : 2 : length (FL_task.mice_NO)
    plot(lMeanTraceTrl_RTh_all(i,:))
    title(FL_task.mice_NO(i))
    pause(0.5)
end


for i = 3 : 3 : length (WD_task.mice_NO)
    plot(meandFF0h_all(i,:))
    title(WD_task.mice_NO(i))
    pause(5)
end

for i = 1 : 3 : length(WD_task.mice_NO)
    figure;
    plot(meandFF0h_all(i,:))
    title([WD_task.mice_NO{i}, ' WD\_day1'])
    % Save the figure as a PNG with a specific filename and dpi
    filename = [WD_task.mice_NO{i}, 'WD_day1.png'];
    print(filename, '-dpng', '-r300');
    close;
end

for i = 2 : 3 : length(WD_task.mice_NO)
    figure;
    plot(meandFF0h_all(i,:))
    title([WD_task.mice_NO{i}, ' WD\_day2'])
    % Save the figure as a PNG with a specific filename and dpi
    filename = [WD_task.mice_NO{i}, 'WD_day2.png'];
    print(filename, '-dpng', '-r300');
    close;
end

for i = 3 : 3 : length(WD_task.mice_NO)
    figure;
    plot(meandFF0h_all(i,:))
    title([WD_task.mice_NO{i}, ' WD\_day3'])
    % Save the figure as a PNG with a specific filename and dpi
    filename = [WD_task.mice_NO{i}, 'WD_day3.png'];
    print(filename, '-dpng', '-r300');
    close;
end


plot(lMeanTraceTrl_RTh_all(i,:))
plot(meandFF0_RTh_all(28,:))
hold on
plot(meandFF0_RTh_all(30,:))
hold on
plot(meandFF0_RTh_all(32,:))
hold on
plot(meandFF0_RTh_all(34,:))
hold on
plot(meandFF0_RTh_all(36,:))


plot(meandFF0h_all(65,:))

find(strcmp(FL_task.mice_NO, 'JH081') == 1) %29, 30
find(strcmp(FL_task.mice_NO, 'JH100') == 1) %37, 38
find(strcmp(FL_task.mice_NO, 'JH101') == 1) %39, 40
find(strcmp(FL_task.mice_NO, 'JH102') == 1) %41, 42
find(strcmp(FL_task.mice_NO, 'JH103') == 1) %43, 44
find(strcmp(FL_task.mice_NO, 'JH114') == 1) %61, 62
find(strcmp(FL_task.mice_NO, 'JH115') == 1) %63, 64
find(strcmp(FL_task.mice_NO, 'JH116') == 1) %65, 66

logical_arrays = [
    find(strcmp(FL_task.mice_NO, 'JH100') == 1)
    find(strcmp(FL_task.mice_NO, 'JH101') == 1)
    find(strcmp(FL_task.mice_NO, 'JH102') == 1)
    find(strcmp(FL_task.mice_NO, 'JH103') == 1)
    find(strcmp(FL_task.mice_NO, 'JH114') == 1)
    find(strcmp(FL_task.mice_NO, 'JH115') == 1)
    find(strcmp(FL_task.mice_NO, 'JH116') == 1)
];

% Loop through the cells in FL_task.Trial_Onsets(logical_arrays)
for i = 1:length(FL_task.Trial_Onsets(logical_arrays))
    % Subtract 3 from each element in the current cell
    FL_task.Trial_Onsets{logical_arrays(i)} = FL_task.Trial_Onsets{logical_arrays(i)} - 4;
end

plot(FL_task.lick{logical_arrays(1)})

plot(FL_task.Trial_Onsets{logical_arrays(1)})



DT_task.mice_NO{end+1} = 'JH126';
DT_task.behavior_data{end+1} = bdata;
DT_task.dFF0{end+1} = dFF;
DT_task.lick{end+1} = chlick;
DT_task.Trial_Onsets{end+1} = TrialOnsets;
DT_task.Valve_Onsets{end+1} = ValveOnsets;
DT_task.RT{end+1} = RT;
clearvars -except DT_task

save('DT_task_data_struct_single.mat', 'DT_task', '-v7.3');



RO_task.mice_NO{end+1} = 'JH126';
RO_task.behavior_data{end+1} = bdata;
RO_task.dFF0{end+1} = dFF;
RO_task.lick{end+1} = chlick;
RO_task.Trial_Onsets{end+1} = TrialOnsets;
RO_task.Valve_Onsets{end+1} = ValveOnsets;
RO_task.RT{end+1} = RT;
clearvars -except RO_task

save('data4_reward_omission_updated.mat', 'RO_task', '-v7.3');

plot(meandFF0_RTh)

%% looking for errors in some dual fiber recordings
plot(meandFF0_RTh)
hold on
plot(MeanlTraceTrl_RTh)

sess_index = 62;
plot(RT - FL_task.RT{sess_index})

length(FL_task.Trial_Onsets{sess_index})
length(TrialOnsets)
plot(TrialOnsets - FL_task.Trial_Onsets{sess_index})

clearvars -except FL_task WD_task DT_task RO_task

plot(dFF)
hold on
plot(FL_task.dFF0{sess_index})

plot(dFF - FL_task.dFF0{sess_index})


FL_task.dFF0{sess_index}=dFF;


plot(MeanlTraceTrl_RTh)
hold on
plot(MeanlTraceTrl_RTf)

plot(meandFF0_RTh)
hold on
plot(meandFF0_RTf)

RT_test = RT_resc_values;

