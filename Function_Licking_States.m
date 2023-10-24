%% Function to detect lick bouts

function [Licking_Times]=Function_Licking_States(Lick, Lick_SR, Times_Stim)

% Lick = piezo lick trace
% Lick_SR = lick trace sampling rate (pt/s)
% Times_Stim = Times of whisker (coil) stimuli (s)



merge_on=0.1; % threshold to merge active states (s)
delete_Act=0.05; % threshold to delete active states (s)

Lick=Lick-median(Lick); % subtract the median

% subtract 50 Hz noise (optional. Can be commented if unecessary)
[Zs,Ps,K]=ellip(4,.1,20,[48 52]*2/Lick_SR); % filter between 48 and 52 Hz
[SOS, G]=zp2sos(Zs, Ps, K);
Lick_bckgrd=filtfilt(SOS, G, Lick);
Lick_1=(Lick-Lick_bckgrd);

% take the absolute value of the Lick trace and smooth it
Lick_1=abs(Lick_1);
Lick_2=smooth(Lick_1,50);

% set the threshold for the lick detection

if isnan(Times_Stim)
    Thrs=mean(Lick_2)+7*std(Lick_2);
else
    
    for t=1:length(Times_Stim)
        pt1=max((Times_Stim(t)-3*Lick_SR),1);
        pt2=Times_Stim(t)-1;
        Lick_baseline(t,1)=mean(Lick_2(pt1:pt2));
        Lick_baseline(t,2)=std(Lick_2(pt1:pt2));
        Lick_baseline(t,3)=max(Lick_2(pt1:pt2));
    end
    Thrs=mean(Lick_baseline(:,1))+ 7*mean(Lick_baseline(:,2));
end

% Make a binary vector / lick threshold (0 if < Thrs ; 1 if > Thrs)
Lick_2=Lick_2-Thrs;
Lick_Stat1=Lick_2./abs(Lick_2);
Lick_Stat1=(Lick_Stat1+1)/2;

% set first and last points to 0
Lick_Stat1(1:5)=0;
Lick_Stat1(end-5:end)=0;

% identify times of transitions
Lick_Stat1_der=diff(Lick_Stat1);
[Amp,Time_On]=findpeaks(Lick_Stat1_der, 'MinPeakHeight',0.1);
Lick_Stat1_der=Lick_Stat1_der.*-1;
[Amp,Time_Off]=findpeaks(Lick_Stat1_der, 'MinPeakHeight',0.1);

% Compute the time difference between 2 consecutive Active states and merge
% them if < merge_on time

merge_on=merge_on*Lick_SR;
if isempty(Time_On)~=1
    Time_On(1)=[];
    Time_Off(end)=[];
    
    Delta_Act=Time_On-Time_Off;
    
    Lick_Stat2=Lick_Stat1;
    
    for int=1:length(Delta_Act)
        
        if Delta_Act(int)<merge_on
            Lick_Stat2(Time_Off(int):Time_On(int))=1;
        end
        
    end
    
    clear WP_Stat1 WP_Stat1_der
    
    % Compute duration of Active states and delete them if < delete_Act
    
    delete_Act=delete_Act*Lick_SR;
    
    Lick_Stat2_der=diff(Lick_Stat2);
    [Amp,Time_On]=findpeaks(Lick_Stat2_der, 'MinPeakHeight',0.1);
    Lick_Stat2_der=Lick_Stat2_der.*-1;
    [Amp,Time_Off]=findpeaks(Lick_Stat2_der, 'MinPeakHeight',0.1);
    Delta_On=Time_Off-Time_On;
    
    Lick_Stat3=Lick_Stat2;
    
    for int=1:length(Delta_On)
        
        if Delta_On(int)<delete_Act+1
            Lick_Stat3(Time_On(int):Time_Off(int))=0;
        end
        
    end
    
    clear Lick_Stat2 Lick_Stat2_der
    
    Lick_Stat3_der=diff(Lick_Stat3);
    [Amp,Time_On]=findpeaks(Lick_Stat3_der, 'MinPeakHeight',0.1);
    Lick_Stat3_der=Lick_Stat3_der.*-1;
    [Amp,Time_Off]=findpeaks(Lick_Stat3_der, 'MinPeakHeight',0.1);
    
    
    Licking_Times=horzcat(Time_On, Time_Off);
    Licking_Times=Licking_Times./Lick_SR;
    
else
    
    Lick_Stat3=Lick.*0;
    Licking_Times=[];
end

% Plot the result

figure
plot(Lick)
hold on
plot(Lick_Stat3*0.1)
ylim([-0.1 0.5])

end