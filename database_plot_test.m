
%% test the  RO session
for j = 1 %: length(RO_task.mice_NO)
    database_RO_calc
end















%% tests to visualize data

plot(lMeanTraceTrlh_d2)
hold on
plot(lMeanTraceTrlm_d2)
hold on


lMeanTraceTrlh_d3=mean(lMeanTraceTrlh_all(3:3:99,:),1);
lMeanTraceTrlm_d3=mean(lMeanTraceTrlm_all(3:3:99,:),1);

lMeanTraceTrlh_d3=mean(lMeanTraceTrlh_all(100:3:123,:),1);
lMeanTraceTrlm_d3=mean(lMeanTraceTrlm_all(100:3:123,:),1);

plot(lMeanTraceTrlh_d3)
hold on
plot(lMeanTraceTrlm_d3)

meandFF0h_d2=mean(meandFF0h_all(2:3:length(DT_task.mice_NO),:),1);


for i=1: 41
    plot(meandFF0h_all(i*3-1,:))
    pause(0.5)
end

for i=1:123
    plot(meandFF0h_all(i,:))
    title(string([i]),'FontSize', 100) 
    pause(0.5)
end

for i=1:size(lMeanTraceTrl_RTh_all,1)
    plot(lMeanTraceTrl_RTh_all(i,:))
    title(string([i]),'FontSize', 100) 
    pause(0.5)
end

for i=1:size(lMeanTraceTrl_RThR1_all,1)
    plot(lMeanTraceTrl_RThR1_all(i,:))
    title(string([i]),'FontSize', 100) 
    pause(0.5)
end

% hard code trial onsets for session 37-44, 61-66 of FL task
for j = 37:44
    FL_task.Trial_Onsets{j, :} = FL_task.Trial_Onsets{j, :} + 3;
end
for j = 61:66
    FL_task.Trial_Onsets{j, :} = FL_task.Trial_Onsets{j, :} + 3;
end

% hard code trial onsets for session 55-66, 91-99 of WD task
for j = 55:66
    WD_task.Trial_Onsets{j, :} = WD_task.Trial_Onsets{j, :} + 3;
end
for j = 91:99
    WD_task.Trial_Onsets{j, :} = WD_task.Trial_Onsets{j, :} + 3;
end

% hard code trial onsets for session 49-60, 76-81 of DT task
for j = 49:60
    DT_task.Trial_Onsets{j, :} = DT_task.Trial_Onsets{j, :} + 3;
end
for j = 76:81
    DT_task.Trial_Onsets{j, :} = DT_task.Trial_Onsets{j, :} + 3;
end

% hard code trial onsets for session 17-20, 26-27 of DT task
for j = 17:20
    RO_task.Trial_Onsets{j, :} = RO_task.Trial_Onsets{j, :} + 3;
end
for j = 26:27
    RO_task.Trial_Onsets{j, :} = RO_task.Trial_Onsets{j, :} + 3;
end
