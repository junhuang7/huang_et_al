clear TraceTrl lTraceTrl
clear TraceTrlh TraceTrlm TraceTrlc TraceTrlf
clear lTraceTrlh lTraceTrlm lTraceTrlc lTraceTrlf
clear meandFF0h meandFF0m lMeanTraceTrlh lMeanTraceTrlm

clear TraceTrl_RT lTraceTrl_RT hit miss CR FA EL 
clear TraceTrl_RTh TraceTrl_RTm TraceTrl_RTc TraceTrl_RTf
clear lTraceTrl_RTh lTraceTrl_RTm lTraceTrl_RTc lTraceTrl_RTf
clear meandFF0_RTh meandFF0_RTf lMeanTraceTrl_RTh lMeanTraceTrl_RTf

clear hitR1 hitR0 miss FA CR idx_valve idx_trial

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
timevec1 = 0:(1/SR):((length(RO_task.dFF0{j})/SR)-1/SR);
timevec_RT=-prestart_RT:1/SR:poststart_RT;
%% calculate signal
% preallocation of array, which saves 0.2 seconds in one session

TraceTrl = zeros(length(RO_task.Trial_Onsets{j}),6*SR+1); 
lTraceTrl = zeros(length(RO_task.Trial_Onsets{j}),6*SR+1);

for i=1:length(RO_task.Trial_Onsets{j})-1;
    TraceTrl(i,:)=RO_task.dFF0{j}(RO_task.Trial_Onsets{j}(i)*SR-prestart*SR:RO_task.Trial_Onsets{j}(i)*SR+poststart*SR);
end

for i=1:length(RO_task.Trial_Onsets{j})-1;
    lTraceTrl(i,:)=RO_task.lick{j}(RO_task.Trial_Onsets{j}(i)*SR-prestart*SR:RO_task.Trial_Onsets{j}(i)*SR+poststart*SR);
end

TraceTrl_RT = zeros(length(RO_task.Trial_Onsets{j}),6*SR+1); 
lTraceTrl_RT = zeros(length(RO_task.Trial_Onsets{j}),6*SR+1);

for i=1:length(RO_task.Trial_Onsets{j})-1;
    TraceTrl_RT(i,:)=RO_task.dFF0{j}(RO_task.Trial_Onsets{j}(i)*SR-prestart_RT*SR+RO_task.RT{j}(i):RO_task.Trial_Onsets{j}(i)*SR+poststart_RT*SR+RO_task.RT{j}(i));
end

for i=1:length(RO_task.Trial_Onsets{j})-1;
    lTraceTrl_RT(i,:)=RO_task.lick{j}(RO_task.Trial_Onsets{j}(i)*SR-prestart_RT*SR+RO_task.RT{j}(i):RO_task.Trial_Onsets{j}(i)*SR+poststart_RT*SR+RO_task.RT{j}(i));
end

%% define trial type

if size((RO_task.behavior_data{j}),2) ==30;
    hit=find(RO_task.behavior_data{j}(:,6)==1&RO_task.behavior_data{j}(:,8)==1&RO_task.behavior_data{j}(:,16)==0);
    miss=find(RO_task.behavior_data{j}(:,6)==1&RO_task.behavior_data{j}(:,8)==0&RO_task.behavior_data{j}(:,16)==0);
    CR=find(RO_task.behavior_data{j}(:,6)==0&RO_task.behavior_data{j}(:,8)==0&RO_task.behavior_data{j}(:,16)==0);
    FA=find(RO_task.behavior_data{j}(:,6)==0&RO_task.behavior_data{j}(:,8)==1&RO_task.behavior_data{j}(:,16)==0);
    EL=find(RO_task.behavior_data{j}(:,16)==1);
elseif size((RO_task.behavior_data{j}),2) ==18;
        hit=find(RO_task.behavior_data{j}(:,6)==1&RO_task.behavior_data{j}(:,9)==1);
        miss=find(RO_task.behavior_data{j}(:,6)==1&RO_task.behavior_data{j}(:,9)==0);
        CR=find(RO_task.behavior_data{j}(:,6)==0&RO_task.behavior_data{j}(:,9)==0);
        FA=find(RO_task.behavior_data{j}(:,6)==0&RO_task.behavior_data{j}(:,9)==1);
        EL=find(isnan(RO_task.behavior_data{j}(:,9)));
end

hitrate = (length(hit))/(length(hit)+length(miss));
FArate = length(FA)/(length(FA)+length(CR));
stimNO = length(hit)+length(miss);
dprime = norminv(hitrate)-norminv(FArate);

% Find matching indices
hitR1 = [];
for idx_valve = 1:numel(RO_task.Valve_Onsets{j})
    valve_onset = RO_task.Valve_Onsets{j}(idx_valve);
    for idx_trial = 1:numel(RO_task.Trial_Onsets{j})
        trial_onset = RO_task.Trial_Onsets{j}(idx_trial);
        if valve_onset - trial_onset <= 4 && valve_onset - trial_onset >= 3
            hitR1 = [hitR1 idx_trial];
            break;
        end
    end
end
hitR0 = setdiff(hit,hitR1);

%% correct behavior file in the database for the Hit (R+) and Hit (RO) trials
if size((RO_task.behavior_data{j}),2) ==30
    false_positive_reward_index = find(RO_task.behavior_data{j}(hitR1,15) == 0);
    false_negative_reward_index_RO = find(RO_task.behavior_data{j}(hitR0,15) == 1);
    false_negative_reward_index_miss = find(RO_task.behavior_data{j}(miss,15) == 1);
    false_negative_reward_index_FA = find(RO_task.behavior_data{j}(FA,15) == 1);
    false_negative_reward_index_CR = find(RO_task.behavior_data{j}(CR,15) == 1);
end
% Check for hitR1(false_positive_reward_index)
if ~isempty(hitR1) && ~isempty(false_positive_reward_index) && max(false_positive_reward_index) <= length(hitR1)
    RO_task.behavior_data{j}(hitR1(false_positive_reward_index),15) = 1;
end

% Check for hitR0(false_negative_reward_index)
if ~isempty(hitR0) && ~isempty(false_negative_reward_index_RO) && max(false_negative_reward_index_RO) <= length(hitR0)
    RO_task.behavior_data{j}(hitR0(false_negative_reward_index_RO),15) = 0;
end

% Check for miss(false_negative_reward_index_miss)
if ~isempty(miss) && ~isempty(false_negative_reward_index_miss) && max(false_negative_reward_index_miss) <= length(miss)
    RO_task.behavior_data{j}(miss(false_negative_reward_index_miss),15) = 0;
end

% Check for FA(false_negative_reward_index_FA)
if ~isempty(FA) && ~isempty(false_negative_reward_index_FA) && max(false_negative_reward_index_FA) <= length(FA)
    RO_task.behavior_data{j}(FA(false_negative_reward_index_FA),15) = 0;
end

% Check for CR(false_negative_reward_index_CR)
if ~isempty(CR) && ~isempty(false_negative_reward_index_CR) && max(false_negative_reward_index_CR) <= length(CR)
    RO_task.behavior_data{j}(CR(false_negative_reward_index_CR),15) = 0;
end

%% whisker-aligned dLight traces
TraceTrlhR1=TraceTrl(hitR1(hitR1<length(TraceTrl(:,1))),:);
TraceTrlhR0=TraceTrl(hitR0(hitR0<length(TraceTrl(:,1))),:);
TraceTrlm=TraceTrl(miss(miss<length(TraceTrl(:,1))),:);
TraceTrlc=TraceTrl(CR(CR<length(TraceTrl(:,1))),:);
TraceTrlf=TraceTrl(FA(FA<length(TraceTrl(:,1))),:);

MeanTraceTrl=mean(TraceTrl,1);
dFF0=TraceTrl-mean(TraceTrl(:,basestart*SR:baseend*SR),2);
meandFF0=mean(dFF0,1);

MeanTraceTrlhR1=mean(TraceTrlhR1,1);
dFF0hR1=TraceTrlhR1-mean(TraceTrlhR1(:,basestart*SR:baseend*SR),2);
meandFF0hR1=mean(dFF0hR1,1);

MeanTraceTrlhR0=mean(TraceTrlhR0,1);
dFF0hR0=TraceTrlhR0-mean(TraceTrlhR0(:,basestart*SR:baseend*SR),2);
meandFF0hR0=mean(dFF0hR0,1);

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
TraceTrl_RThR1=TraceTrl_RT(hitR1(hitR1<length(TraceTrl_RT(:,1))),:);
TraceTrl_RThR0=TraceTrl_RT(hitR0(hitR0<length(TraceTrl_RT(:,1))),:);
TraceTrl_RTm=TraceTrl_RT(miss(miss<length(TraceTrl_RT(:,1))),:);
TraceTrl_RTc=TraceTrl_RT(CR(CR<length(TraceTrl_RT(:,1))),:);
TraceTrl_RTf=TraceTrl_RT(FA(FA<length(TraceTrl_RT(:,1))),:);

MeanTraceTrl_RT=mean(TraceTrl_RT,1);
dFF0_RT=TraceTrl_RT-mean(TraceTrl_RT(:,basestart*SR:baseend*SR),2);
meandFF0_RT=mean(dFF0_RT,1);

MeanTraceTrl_RThR1=mean(TraceTrl_RThR1,1);
dFF0_RThR1=TraceTrl_RThR1-mean(TraceTrl_RThR1(:,basestart*SR:baseend*SR),2);
meandFF0_RThR1=mean(dFF0_RThR1,1);

MeanTraceTrl_RThR0=mean(TraceTrl_RThR0,1);
dFF0_RThR0=TraceTrl_RThR0-mean(TraceTrl_RThR0(:,basestart*SR:baseend*SR),2);
meandFF0_RThR0=mean(dFF0_RThR0,1);

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
lTraceTrlhR1=lTraceTrl(hitR1(hitR1<length(TraceTrl(:,1))),:);
lTraceTrlhR0=lTraceTrl(hitR0(hitR0<length(TraceTrl(:,1))),:);
lTraceTrlm=lTraceTrl(miss(miss<length(TraceTrl(:,1))),:);
lTraceTrlc=lTraceTrl(CR(CR<length(TraceTrl(:,1))),:);
lTraceTrlf=lTraceTrl(FA(FA<length(TraceTrl(:,1))),:);

lMeanTraceTrl=mean(lTraceTrl,1);
lMeanTraceTrlhR1=mean(lTraceTrlhR1,1);
lMeanTraceTrlhR0=mean(lTraceTrlhR0,1);
lMeanTraceTrlm=mean(lTraceTrlm,1);
lMeanTraceTrlc=mean(lTraceTrlc,1);
lMeanTraceTrlf=mean(lTraceTrlf,1);

lTraceTrl_RThR1=lTraceTrl_RT(hitR1(hitR1<length(TraceTrl_RT(:,1))),:);
lTraceTrl_RThR0=lTraceTrl_RT(hitR0(hitR0<length(TraceTrl_RT(:,1))),:);
lTraceTrl_RTm=lTraceTrl_RT(miss(miss<length(TraceTrl_RT(:,1))),:);
lTraceTrl_RTc=lTraceTrl_RT(CR(CR<length(TraceTrl_RT(:,1))),:);
lTraceTrl_RTf=lTraceTrl_RT(FA(FA<length(TraceTrl_RT(:,1))),:);

lMeanTraceTrl_RT=mean(lTraceTrl_RT,1);
lMeanTraceTrl_RThR1=mean(lTraceTrl_RThR1,1);
lMeanTraceTrl_RThR0=mean(lTraceTrl_RThR0,1);
lMeanTraceTrl_RTm=mean(lTraceTrl_RTm,1);
lMeanTraceTrl_RTc=mean(lTraceTrl_RTc,1);
lMeanTraceTrl_RTf=mean(lTraceTrl_RTf,1);

%% calculate the average of the first 30 trials vs. the last 30 trials

if length(hitR1)<=30
    meandFF0hR1_head=mean(dFF0hR1,1);
    meandFF0hR1_tail=mean(dFF0hR1,1);
    lTraceTrlhR1_head=mean(lTraceTrlhR1,1);
    lTraceTrlhR1_tail=mean(lTraceTrlhR1,1);
else
    meandFF0hR1_head=mean(dFF0hR1(1:30,:),1);
    meandFF0hR1_tail=mean(dFF0hR1(end-30:end,:),1);  
    lTraceTrlhR1_head=mean(lTraceTrlhR1(1:30,:),1);
    lTraceTrlhR1_tail=mean(lTraceTrlhR1(end-30:end,:),1);
end


if length(hitR0)<=30
    meandFF0hR0_head=mean(dFF0hR0,1);
    meandFF0hR0_tail=mean(dFF0hR0,1);
    lTraceTrlhR0_head=mean(lTraceTrlhR0,1);
    lTraceTrlhR0_tail=mean(lTraceTrlhR0,1);
else
    meandFF0hR0_head=mean(dFF0hR0(1:30,:),1);
    meandFF0hR0_tail=mean(dFF0hR0(end-30:end,:),1);  
    lTraceTrlhR0_head=mean(lTraceTrlhR0(1:30,:),1);
    lTraceTrlhR0_tail=mean(lTraceTrlhR0(end-30:end,:),1);
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

if length(hitR1)<=30
    meandFF0_RThR1_head=mean(dFF0_RThR1,1);
    meandFF0_RThR1_tail=mean(dFF0_RThR1,1);
    lTraceTrl_RThR1_head=mean(lTraceTrl_RThR1,1);
    lTraceTrl_RThR1_tail=mean(lTraceTrl_RThR1,1);
else
    meandFF0_RThR1_head=mean(dFF0_RThR1(1:30,:),1);
    meandFF0_RThR1_tail=mean(dFF0_RThR1(end-30:end,:),1);  
    lTraceTrl_RThR1_head=mean(lTraceTrl_RThR1(1:30,:),1);
    lTraceTrl_RThR1_tail=mean(lTraceTrl_RThR1(end-30:end,:),1);
end


if length(hitR0)<=30
    meandFF0_RThR0_head=mean(dFF0_RThR0,1);
    meandFF0_RThR0_tail=mean(dFF0_RThR0,1);
    lTraceTrl_RThR0_head=mean(lTraceTrl_RThR0,1);
    lTraceTrl_RThR0_tail=mean(lTraceTrl_RThR0,1);
else
    meandFF0_RThR0_head=mean(dFF0_RThR0(1:30,:),1);
    meandFF0_RThR0_tail=mean(dFF0_RThR0(end-30:end,:),1);  
    lTraceTrl_RThR0_head=mean(lTraceTrl_RThR0(1:30,:),1);
    lTraceTrl_RThR0_tail=mean(lTraceTrl_RThR0(end-30:end,:),1);
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

















