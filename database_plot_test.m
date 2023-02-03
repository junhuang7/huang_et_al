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


for i=1: 27
    plot(meandFF0h_all(i*3-1,:))
    pause(0.5)
end

for i=1: 27
    plot(lMeanTraceTrlh_all(i*3-1,:))
    pause(0.5)
end



