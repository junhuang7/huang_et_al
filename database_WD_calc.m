clear TraceTrl lTraceTrl
clear TraceTrlh TraceTrlm TraceTrlc TraceTrlf
clear lTraceTrlh lTraceTrlm lTraceTrlc lTraceTrlf
clear meandFF0h meandFF0m lMeanTraceTrlh lMeanTraceTrlm

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
timevec1 = 0:(1/SR):((length(WD_task.dFF0{j})/SR)-1/SR);
timevec_RT=-prestart_RT:1/SR:poststart_RT;

%% calculate signal
% preallocation of array, which saves 0.2 seconds in one session

TraceTrl = zeros(length(WD_task.Trial_Onsets{j}),6*SR+1); 
lTraceTrl = zeros(length(WD_task.Trial_Onsets{j}),6*SR+1);

for i=1:length(WD_task.Trial_Onsets{j})-1;
    TraceTrl(i,:)=WD_task.dFF0{j}(WD_task.Trial_Onsets{j}(i)*SR-prestart*SR:WD_task.Trial_Onsets{j}(i)*SR+poststart*SR);
end

for i=1:length(WD_task.Trial_Onsets{j})-1;
    lTraceTrl(i,:)=WD_task.lick{j}(WD_task.Trial_Onsets{j}(i)*SR-prestart*SR:WD_task.Trial_Onsets{j}(i)*SR+poststart*SR);
end

TraceTrl_RT = zeros(length(WD_task.Trial_Onsets{j}),6*SR+1); 
lTraceTrl_RT = zeros(length(WD_task.Trial_Onsets{j}),6*SR+1);

for i=1:length(WD_task.Trial_Onsets{j})-1;
    TraceTrl_RT(i,:)=WD_task.dFF0{j}(WD_task.Trial_Onsets{j}(i)*SR-prestart_RT*SR+WD_task.RT{j}(i):WD_task.Trial_Onsets{j}(i)*SR+poststart_RT*SR+WD_task.RT{j}(i));
end

for i=1:length(WD_task.Trial_Onsets{j})-1;
    lTraceTrl_RT(i,:)=WD_task.lick{j}(WD_task.Trial_Onsets{j}(i)*SR-prestart_RT*SR+WD_task.RT{j}(i):WD_task.Trial_Onsets{j}(i)*SR+poststart_RT*SR+WD_task.RT{j}(i));
end

%% define trial type

if size((WD_task.behavior_data{j}),2) ==30;
    hit=find(WD_task.behavior_data{j}(:,6)==1&WD_task.behavior_data{j}(:,8)==1&WD_task.behavior_data{j}(:,16)==0);
    miss=find(WD_task.behavior_data{j}(:,6)==1&WD_task.behavior_data{j}(:,8)==0&WD_task.behavior_data{j}(:,16)==0);
    CR=find(WD_task.behavior_data{j}(:,6)==0&WD_task.behavior_data{j}(:,8)==0&WD_task.behavior_data{j}(:,16)==0);
    FA=find(WD_task.behavior_data{j}(:,6)==0&WD_task.behavior_data{j}(:,8)==1&WD_task.behavior_data{j}(:,16)==0);
    EL=find(WD_task.behavior_data{j}(:,16)==1);
elseif size((WD_task.behavior_data{j}),2) ==18;
        hit=find(WD_task.behavior_data{j}(:,6)==1&WD_task.behavior_data{j}(:,9)==1);
        miss=find(WD_task.behavior_data{j}(:,6)==1&WD_task.behavior_data{j}(:,9)==0);
        CR=find(WD_task.behavior_data{j}(:,6)==0&WD_task.behavior_data{j}(:,9)==0);
        FA=find(WD_task.behavior_data{j}(:,6)==0&WD_task.behavior_data{j}(:,9)==1);
        EL=find(isnan(WD_task.behavior_data{j}(:,9)));
end

hitrate = (length(hit))/(length(hit)+length(miss));
FArate = length(FA)/(length(FA)+length(CR));
stimNO = length(hit)+length(miss);
dprime = norminv(hitrate)-norminv(FArate);

%% whisker-aligned dLight traces
TraceTrlh=TraceTrl(hit(hit<length(TraceTrl(:,1))),:);
TraceTrlm=TraceTrl(miss(miss<length(TraceTrl(:,1))),:);
TraceTrlc=TraceTrl(CR(CR<length(TraceTrl(:,1))),:);
TraceTrlf=TraceTrl(FA(FA<length(TraceTrl(:,1))),:);

MeanTraceTrl=mean(TraceTrl,1);
dFF0=TraceTrl-mean(TraceTrl(:,basestart*SR:baseend*SR),2);
meandFF0=mean(dFF0,1);

f_std=median(std(dFF0 (:,basestart*SR:baseend*SR),0,2));

MeanTraceTrlh=mean(TraceTrlh,1);
dFF0h=TraceTrlh-mean(TraceTrlh(:,basestart*SR:baseend*SR),2);
meandFF0h=mean(dFF0h,1);

MeanTraceTrlm=mean(TraceTrlm,1);
dFF0m=TraceTrlm-mean(TraceTrlm(:,basestart*SR:baseend*SR),2);
meandFF0m=mean(dFF0m,1);

MeanTraceTrlc=mean(TraceTrlc,1);
dFF0c=TraceTrlc-mean(TraceTrlc(:,basestart*SR:baseend*SR),2);
meandFF0c=mean(dFF0c,1);

MeanTraceTrlf=mean(TraceTrlf,1);
dFF0f=TraceTrlf-mean(TraceTrlf(:,basestart*SR:baseend*SR),2);
meandFF0f=mean(dFF0f,1);
%% lick-aligned dLight traces
TraceTrl_RTh=TraceTrl_RT(hit(hit<length(TraceTrl_RT(:,1))),:);
TraceTrl_RTm=TraceTrl_RT(miss(miss<length(TraceTrl_RT(:,1))),:);
TraceTrl_RTc=TraceTrl_RT(CR(CR<length(TraceTrl_RT(:,1))),:);
TraceTrl_RTf=TraceTrl_RT(FA(FA<length(TraceTrl_RT(:,1))),:);

MeanTraceTrl_RT=mean(TraceTrl_RT,1);
dFF0_RT=TraceTrl_RT-mean(TraceTrl_RT(:,basestart*SR:baseend*SR),2);
meandFF0_RT=mean(dFF0_RT,1);

MeanTraceTrl_RTh=mean(TraceTrl_RTh,1);
dFF0_RTh=TraceTrl_RTh-mean(TraceTrl_RTh(:,basestart*SR:baseend*SR),2);
meandFF0_RTh=mean(dFF0_RTh,1);

MeanTraceTrl_RTm=mean(TraceTrl_RTm,1);
dFF0_RTm=TraceTrl_RTm-mean(TraceTrl_RTm(:,basestart*SR:baseend*SR),2);
meandFF0_RTm=mean(dFF0_RTm,1);

MeanTraceTrl_RTc=mean(TraceTrl_RTc,1);
dFF0_RTc=TraceTrl_RTc-mean(TraceTrl_RTc(:,basestart*SR:baseend*SR),2);
meandFF0_RTc=mean(dFF0_RTc,1);

MeanTraceTrl_RTf=mean(TraceTrl_RTf,1);
dFF0_RTf=TraceTrl_RTf-mean(TraceTrl_RTf(:,basestart*SR:baseend*SR),2);
meandFF0_RTf=mean(dFF0_RTf,1);

%% calculate licking traces
lTraceTrlh=lTraceTrl(hit(hit<length(TraceTrl(:,1))),:);
lTraceTrlm=lTraceTrl(miss(miss<length(TraceTrl(:,1))),:);
lTraceTrlc=lTraceTrl(CR(CR<length(TraceTrl(:,1))),:);
lTraceTrlf=lTraceTrl(FA(FA<length(TraceTrl(:,1))),:);

lMeanTraceTrl=mean(lTraceTrl,1);
lMeanTraceTrlh=mean(lTraceTrlh,1);
lMeanTraceTrlm=mean(lTraceTrlm,1);
lMeanTraceTrlc=mean(lTraceTrlc,1);
lMeanTraceTrlf=mean(lTraceTrlf,1);

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
    meandFF0h_head=mean(dFF0h,1);
    meandFF0h_tail=mean(dFF0h,1);
    lTraceTrlh_head=mean(lTraceTrlh,1);
    lTraceTrlh_tail=mean(lTraceTrlh,1);
else
    meandFF0h_head=mean(dFF0h(1:30,:),1);
    meandFF0h_tail=mean(dFF0h(end-30:end,:),1);  
    lTraceTrlh_head=mean(lTraceTrlh(1:30,:),1);
    lTraceTrlh_tail=mean(lTraceTrlh(end-30:end,:),1);
end

if length(miss)<=30
    meandFF0m_head=mean(dFF0m,1);
    meandFF0m_tail=mean(dFF0m,1);
    lTraceTrlm_head=mean(lTraceTrlm,1);
    lTraceTrlm_tail=mean(lTraceTrlm,1);
else
    meandFF0m_head=mean(dFF0m(1:30,:),1);
    meandFF0m_tail=mean(dFF0m(end-30:end,:),1);
    lTraceTrlm_head=mean(lTraceTrlm(1:30,:),1);
    lTraceTrlm_tail=mean(lTraceTrlm(end-30:end,:),1);
end

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

















