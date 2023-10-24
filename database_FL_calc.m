clear TraceTrl_RT lTraceTrl_RT hit miss CR FA EL 
clear TraceTrl_RTh TraceTrl_RTm TraceTrl_RTc TraceTrl_RTf
clear lTraceTrl_RTh lTraceTrl_RTm lTraceTrl_RTc lTraceTrl_RTf
clear meandFF0_RTh meandFF0_RTf lMeanTraceTrl_RTh lMeanTraceTrl_RTf
%% trial basis definition
SR=1000; %sampling rate in Hz
prestart=1;% sec, duration before trial start relative to trigger
poststart=5;% sec, duriation after trial start relative to trigger
prestart_RT=3;% sec, duration before trial start relative to trigger
poststart_RT=3;% sec, duriation after trial start relative to trigger
basestart=0.001; % sec, baseline start for calculating dFF0_RT relative to trial start trigger
baseend=1;% sec, baseline end for calculating dFF0_RT relative to trial start trigger
basestart_RT=0;
baseend_RT=1;
timevec=-prestart:1/SR:poststart;
timevec1 = 0:(1/SR):((length(FL_task.dFF0{j})/SR)-1/SR);
timevec_RT=-prestart_RT:1/SR:poststart_RT;
%% calculate signal
% preallocation of array, which saves 0.2 seconds in one session
TraceTrl_RT = zeros(length(FL_task.Trial_Onsets{j}),6*SR+1);
lTraceTrl_RT = zeros(length(FL_task.Trial_Onsets{j}),6*SR+1);

for i=1:length(FL_task.Trial_Onsets{j})-1;
    TraceTrl_RT(i,:)=FL_task.dFF0{j}(FL_task.Trial_Onsets{j}(i)*SR-prestart_RT*SR+FL_task.RT{j}(i):FL_task.Trial_Onsets{j}(i)*SR+poststart_RT*SR+FL_task.RT{j}(i));
end

for i=1:length(FL_task.Trial_Onsets{j})-1;
    lTraceTrl_RT(i,:)=FL_task.lick{j}(FL_task.Trial_Onsets{j}(i)*SR-prestart_RT*SR+FL_task.RT{j}(i):FL_task.Trial_Onsets{j}(i)*SR+poststart_RT*SR+FL_task.RT{j}(i));
end

%% define trial type

if size((FL_task.behavior_data{j}),2) ==30;
    hit=find(FL_task.behavior_data{j}(:,6)==1&FL_task.behavior_data{j}(:,8)==1&FL_task.behavior_data{j}(:,16)==0);
    miss=find(FL_task.behavior_data{j}(:,6)==1&FL_task.behavior_data{j}(:,8)==0&FL_task.behavior_data{j}(:,16)==0);
    CR=find(FL_task.behavior_data{j}(:,6)==0&FL_task.behavior_data{j}(:,8)==0&FL_task.behavior_data{j}(:,16)==0);
    FA=find(FL_task.behavior_data{j}(:,6)==0&FL_task.behavior_data{j}(:,8)==1&FL_task.behavior_data{j}(:,16)==0);
    EL=find(FL_task.behavior_data{j}(:,16)==1);
elseif size((FL_task.behavior_data{j}),2) ==18;
        hit=find(FL_task.behavior_data{j}(:,6)==1&FL_task.behavior_data{j}(:,9)==1);
        miss=find(FL_task.behavior_data{j}(:,6)==1&FL_task.behavior_data{j}(:,9)==0);
        CR=find(FL_task.behavior_data{j}(:,6)==0&FL_task.behavior_data{j}(:,9)==0);
        FA=find(FL_task.behavior_data{j}(:,6)==0&FL_task.behavior_data{j}(:,9)==1);
        EL=find(isnan(FL_task.behavior_data{j}(:,9)));
end

hitrate = (length(hit))/(length(hit)+length(miss));
FArate = length(FA)/(length(FA)+length(CR));
stimNO = length(hit)+length(miss);
dprime = norminv(hitrate)-norminv(FArate);

%% calculate FP traces
TraceTrl_RTh=TraceTrl_RT(hit(hit<length(TraceTrl_RT(:,1))),:);
TraceTrl_RTm=TraceTrl_RT(miss(miss<length(TraceTrl_RT(:,1))),:);
TraceTrl_RTc=TraceTrl_RT(CR(CR<length(TraceTrl_RT(:,1))),:);
TraceTrl_RTf=TraceTrl_RT(FA(FA<length(TraceTrl_RT(:,1))),:);

MeanTraceTrl_RT=mean(TraceTrl_RT,1);
dFF0_RT=TraceTrl_RT-mean(TraceTrl_RT(:,basestart*SR:baseend*SR),2);
meandFF0_RT=mean(dFF0_RT,1);

MeanTraceTrl_RTh=mean(TraceTrl_RTh,1);
dFF0_RTh=TraceTrl_RTh-mean(TraceTrl_RTh(:,basestart*SR:baseend*SR),2);
meandFF0_RTh=nanmean(dFF0_RTh,1);

MeanTraceTrl_RTm=mean(TraceTrl_RTm,1);
dFF0_RTm=TraceTrl_RTm-mean(TraceTrl_RTm(:,basestart*SR:baseend*SR),2);
meandFF0_RTm=nanmean(dFF0_RTm,1);

MeanTraceTrl_RTc=mean(TraceTrl_RTc,1);
dFF0_RTc=TraceTrl_RTc-mean(TraceTrl_RTc(:,basestart*SR:baseend*SR),2);
meandFF0_RTc=nanmean(dFF0_RTc,1);

MeanTraceTrl_RTf=mean(TraceTrl_RTf,1);
dFF0_RTf=TraceTrl_RTf-mean(TraceTrl_RTf(:,basestart*SR:baseend*SR),2);
meandFF0_RTf=nanmean(dFF0_RTf,1);

%% calculate licking traces
lTraceTrl_RTh=lTraceTrl_RT(hit(hit<length(TraceTrl_RT(:,1))),:);
lTraceTrl_RTm=lTraceTrl_RT(miss(miss<length(TraceTrl_RT(:,1))),:);
lTraceTrl_RTc=lTraceTrl_RT(CR(CR<length(TraceTrl_RT(:,1))),:);
lTraceTrl_RTf=lTraceTrl_RT(FA(FA<length(TraceTrl_RT(:,1))),:);

lMeanTraceTrl_RT=mean(lTraceTrl_RT,1);
lMeanTraceTrl_RTh=mean(lTraceTrl_RTh,1);
lMeanTraceTrl_RTm=mean(lTraceTrl_RTm,1);
lMeanTraceTrl_RTc=mean(lTraceTrl_RTc,1);
lMeanTraceTrl_RTf=mean(lTraceTrl_RTf,1);

%% calculate the average of the first 30 trials vs. the last 30 trials

if length(hit)<=30
    meandFF0_RTh_head=mean(dFF0_RTh,1);
    meandFF0_RTh_tail=mean(dFF0_RTh,1);
    lTraceTrl_RTh_head=mean(lTraceTrl_RTh,1);
    lTraceTrl_RTh_tail=mean(lTraceTrl_RTh,1);
else
    meandFF0_RTh_head=mean(dFF0_RTh(1:30,:),1);
    meandFF0_RTh_tail=mean(dFF0_RTh(end-30:end,:),1);  
    lTraceTrl_RTh_head=mean(lTraceTrl_RTh(1:30,:),1);
    lTraceTrl_RTh_tail=mean(lTraceTrl_RTh(end-30:end,:),1);
end

if length(FA)<=30
    meandFF0_RTf_head=mean(dFF0_RTf,1);
    meandFF0_RTf_tail=mean(dFF0_RTf,1);
    lTraceTrl_RTf_head=mean(lTraceTrl_RTf,1);
    lTraceTrl_RTf_tail=mean(lTraceTrl_RTf,1);
else
    meandFF0_RTf_head=mean(dFF0_RTf(1:30,:),1);
    meandFF0_RTf_tail=mean(dFF0_RTf(end-30:end,:),1);
    lTraceTrl_RTf_head=mean(lTraceTrl_RTf(1:30,:),1);
    lTraceTrl_RTf_tail=mean(lTraceTrl_RTf(end-30:end,:),1);
end




















