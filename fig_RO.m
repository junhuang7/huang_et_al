tic
clear all
clc

cd(fileparts(matlab.desktop.editor.getActiveFilename))
addpath ([(fileparts(matlab.desktop.editor.getActiveFilename)) '\boundedline'])
addpath ([(fileparts(matlab.desktop.editor.getActiveFilename)) '\Inpaint_nans'])
load('RO_task_data_struct_single.mat')%load database file

%% fig3_30 plotting of hit vs. miss trials in RO day 1

warning('off','all')
SR=1000;

meandFF0_RThR1_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0_RThR0_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0_RTf_all=zeros(length(RO_task.mice_NO),6*SR+1);
lMeanTraceTrl_RThR1_all=zeros(length(RO_task.mice_NO),6*SR+1);
lMeanTraceTrl_RThR0_all=zeros(length(RO_task.mice_NO),6*SR+1);
lMeanTraceTrl_RTf_all=zeros(length(RO_task.mice_NO),6*SR+1);

meandFF0_RThR1_head_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0_RThR0_head_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0_RTf_head_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0_RThR1_tail_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0_RThR0_tail_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0_RTf_tail_all=zeros(length(RO_task.mice_NO),6*SR+1);
lTraceTrl_RThR1_head_all=zeros(length(RO_task.mice_NO),6*SR+1);
lTraceTrl_RThR0_head_all=zeros(length(RO_task.mice_NO),6*SR+1);
lTraceTrl_RTf_head_all=zeros(length(RO_task.mice_NO),6*SR+1);
lTraceTrl_RThR1_tail_all=zeros(length(RO_task.mice_NO),6*SR+1);
lTraceTrl_RThR0_tail_all=zeros(length(RO_task.mice_NO),6*SR+1);
lTraceTrl_RTf_tail_all=zeros(length(RO_task.mice_NO),6*SR+1);

meandFF0hR1_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0hR0_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0m_all=zeros(length(RO_task.mice_NO),6*SR+1);
lMeanTraceTrlhR1_all=zeros(length(RO_task.mice_NO),6*SR+1);
lMeanTraceTrlhR0_all=zeros(length(RO_task.mice_NO),6*SR+1);
lMeanTraceTrlm_all=zeros(length(RO_task.mice_NO),6*SR+1);

meandFF0hR1_head_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0hR0_head_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0m_head_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0hR1_tail_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0hR0_tail_all=zeros(length(RO_task.mice_NO),6*SR+1);
meandFF0m_tail_all=zeros(length(RO_task.mice_NO),6*SR+1);
lTraceTrlhR1_head_all=zeros(length(RO_task.mice_NO),6*SR+1);
lTraceTrlhR0_head_all=zeros(length(RO_task.mice_NO),6*SR+1);
lTraceTrlm_head_all=zeros(length(RO_task.mice_NO),6*SR+1);
lTraceTrlhR1_tail_all=zeros(length(RO_task.mice_NO),6*SR+1);
lTraceTrlhR0_tail_all=zeros(length(RO_task.mice_NO),6*SR+1);
lTraceTrlm_tail_all=zeros(length(RO_task.mice_NO),6*SR+1);

for j = 1:length(RO_task.mice_NO)
    database_RO_calc
    meandFF0hR1_all(j,:)=meandFF0hR1;
    meandFF0hR0_all(j,:)=meandFF0hR0;
    meandFF0m_all(j,:)=meandFF0m;
    lMeanTraceTrlhR1_all(j,:)=lMeanTraceTrlhR1;
    lMeanTraceTrlhR0_all(j,:)=lMeanTraceTrlhR0;
    lMeanTraceTrlm_all(j,:)=lMeanTraceTrlm;
    meandFF0hR1_head_all(j,:)=meandFF0hR1_head;
    meandFF0hR1_tail_all(j,:)=meandFF0hR1_tail;    
    meandFF0hR0_head_all(j,:)=meandFF0hR0_head;
    meandFF0hR0_tail_all(j,:)=meandFF0hR0_tail;
    meandFF0m_head_all(j,:)=meandFF0m_head;
    meandFF0m_tail_all(j,:)=meandFF0m_tail;
    lTraceTrlhR1_head_all(j,:)=lTraceTrlhR1_head;
    lTraceTrlhR1_tail_all(j,:)=lTraceTrlhR1_tail;
    lTraceTrlhR0_head_all(j,:)=lTraceTrlhR0_head;
    lTraceTrlhR0_tail_all(j,:)=lTraceTrlhR0_tail;
    lTraceTrlm_head_all(j,:)=lTraceTrlm_head;
    lTraceTrlm_tail_all(j,:)=lTraceTrlm_tail;
    meandFF0_RThR1_all(j,:)=meandFF0_RThR1;
    meandFF0_RThR0_all(j,:)=meandFF0_RThR0;
    meandFF0_RTf_all(j,:)=meandFF0_RTf;
    lMeanTraceTrl_RThR1_all(j,:)=lMeanTraceTrl_RThR1;
    lMeanTraceTrl_RThR0_all(j,:)=lMeanTraceTrl_RThR0;
    lMeanTraceTrl_RTf_all(j,:)=lMeanTraceTrl_RTf;
    meandFF0_RThR1_head_all(j,:)=meandFF0_RThR1_head;
    meandFF0_RThR1_tail_all(j,:)=meandFF0_RThR1_tail;
    meandFF0_RThR0_head_all(j,:)=meandFF0_RThR0_head;
    meandFF0_RThR0_tail_all(j,:)=meandFF0_RThR0_tail;
    meandFF0_RTf_head_all(j,:)=meandFF0_RTf_head;
    meandFF0_RTf_tail_all(j,:)=meandFF0_RTf_tail;
    lTraceTrl_RThR1_head_all(j,:)=lTraceTrl_RThR1_head;
    lTraceTrl_RThR1_tail_all(j,:)=lTraceTrl_RThR1_tail;
    lTraceTrl_RThR0_head_all(j,:)=lTraceTrl_RThR0_head;
    lTraceTrl_RThR0_tail_all(j,:)=lTraceTrl_RThR0_tail;
    lTraceTrl_RTf_head_all(j,:)=lTraceTrl_RTf_head;
    lTraceTrl_RTf_tail_all(j,:)=lTraceTrl_RTf_tail;
end

%dLight trace calculations
meandFF0hR1_d1=mean(meandFF0hR1_all(1:length(RO_task.mice_NO),:),1);
stddFF0hR1_d1=std(meandFF0hR1_all(1:length(RO_task.mice_NO),:),1,1);
meandFF0hR0_d1=mean(meandFF0hR0_all(1:length(RO_task.mice_NO),:),1);
stddFF0hR0_d1=std(meandFF0hR0_all(1:length(RO_task.mice_NO),:),1,1);
meandFF0m_d1=mean(meandFF0m_all(1:length(RO_task.mice_NO),:),1);
stddFF0m_d1=std(meandFF0m_all(1:length(RO_task.mice_NO),:),1,1);


%licking trace calculations
lMeanTraceTrlhR1_d1=mean(lMeanTraceTrlhR1_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrlhR1_d1=std(lMeanTraceTrlhR1_all(1:length(RO_task.mice_NO),:),1,1);
lMeanTraceTrlhR0_d1=mean(lMeanTraceTrlhR0_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrlhR0_d1=std(lMeanTraceTrlhR0_all(1:length(RO_task.mice_NO),:),1,1);
lMeanTraceTrlm_d1=mean(lMeanTraceTrlm_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrlm_d1=std(lMeanTraceTrlm_all(1:length(RO_task.mice_NO),:),1,1);



figure(1)
boundedline(timevec_RT,meandFF0hR1_d1,stddFF0hR1_d1./sqrt(length(RO_task.mice_NO)),'b')
hold on
boundedline(timevec_RT,meandFF0hR0_d1,stddFF0hR0_d1./sqrt(length(RO_task.mice_NO)),'g')
hold on
boundedline(timevec_RT,meandFF0m_d1,stddFF0m_d1./sqrt(length(RO_task.mice_NO)),'r')
hold on
h1=plot(timevec_RT,meandFF0hR1_d1,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0hR0_d1,'g-','LineWidth',2)
hold on
h3=plot(timevec_RT,meandFF0m_d1,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h4=line([0,0],[-0.01,0.01],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.02]) 
xx=legend([h1 h2 h3 h4], 'Hit (R+)', 'Hit (RO)', 'Miss','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Day1 (n = 29 mice)'],'FontSize',20)
h=figure(1)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_30_RO_hit_miss_d1_dLight', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

figure(2)
boundedline(timevec_RT,lMeanTraceTrlhR1_d1,stdlTraceTrlhR1_d1./sqrt(length(RO_task.mice_NO)),'b')
hold on
boundedline(timevec_RT,lMeanTraceTrlhR0_d1,stdlTraceTrlhR0_d1./sqrt(length(RO_task.mice_NO)),'g')
hold on
boundedline(timevec_RT,lMeanTraceTrlm_d1,stdlTraceTrlm_d1./sqrt(length(RO_task.mice_NO)),'r')
hold on
h1=plot(timevec_RT,lMeanTraceTrlhR1_d1,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lMeanTraceTrlhR0_d1,'g-','LineWidth',2)
hold on
h3=plot(timevec_RT,lMeanTraceTrlm_d1,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h4=line([0,0],[-0.01,0.1],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.01 0.2]) 
xx=legend([h1 h2 h3], 'HitR1', 'HitR0', 'Miss','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Day1 (n = 29 mice)'],'FontSize',20)
h=figure(2)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_30_RO_hit_miss_d1_lick', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close


%% Hit vs. FA on Day 1

%dLight trace calculations
meandFF0_RThR1_d1=mean(meandFF0_RThR1_all(1:length(RO_task.mice_NO),:),1);
stddFF0_RThR1_d1=std(meandFF0_RThR1_all(1:length(RO_task.mice_NO),:),1,1);
meandFF0_RThR0_d1=mean(meandFF0_RThR0_all(1:length(RO_task.mice_NO),:),1);
stddFF0_RThR0_d1=std(meandFF0_RThR0_all(1:length(RO_task.mice_NO),:),1,1);


meandFF0_RTf_d1=nanmean(meandFF0_RTf_all(1:length(RO_task.mice_NO),:),1);
stddFF0_RTf_d1=nanstd(meandFF0_RTf_all(1:length(RO_task.mice_NO),:),1,1);

%licking trace calculations
lMeanTraceTrl_RThR1_d1=mean(lMeanTraceTrl_RThR1_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrl_RThR1_d1=std(lMeanTraceTrl_RThR1_all(1:length(RO_task.mice_NO),:),1,1);
lMeanTraceTrl_RThR0_d1=mean(lMeanTraceTrl_RThR0_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrl_RThR0_d1=std(lMeanTraceTrl_RThR0_all(1:length(RO_task.mice_NO),:),1,1);
lMeanTraceTrl_RTf_d1=nanmean(lMeanTraceTrl_RTf_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrl_RTf_d1=nanstd(lMeanTraceTrl_RTf_all(1:length(RO_task.mice_NO),:),1,1);

figure(3)
boundedline(timevec_RT,meandFF0_RThR1_d1,stddFF0_RThR1_d1./sqrt(length(RO_task.mice_NO)),'b')
hold on
boundedline(timevec_RT,meandFF0_RThR0_d1,stddFF0_RThR0_d1./sqrt(length(RO_task.mice_NO)),'g')
hold on
boundedline(timevec_RT,meandFF0_RTf_d1,stddFF0_RTf_d1./sqrt(length(RO_task.mice_NO)),'r')
hold on
h1=plot(timevec_RT,meandFF0_RThR1_d1,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RThR0_d1,'g-','LineWidth',2)
hold on
h3=plot(timevec_RT,meandFF0_RTf_d1,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h4=line([0,0],[-0.01,0.01],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.02]) 
xx=legend([h1 h2 h3 h4], 'Hit (R+)', 'Hit (RO)', 'FA','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Day1 (n = 29 mice)'],'FontSize',20)
h=figure(3)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_30_RO_hit_FA_d1_dLight', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

figure(4)
boundedline(timevec_RT,lMeanTraceTrl_RThR1_d1,stdlTraceTrl_RThR1_d1./sqrt(length(RO_task.mice_NO)),'b')
hold on
boundedline(timevec_RT,lMeanTraceTrl_RThR0_d1,stdlTraceTrl_RThR0_d1./sqrt(length(RO_task.mice_NO)),'g')
hold on
boundedline(timevec_RT,lMeanTraceTrl_RTf_d1,stdlTraceTrl_RTf_d1./sqrt(length(RO_task.mice_NO)),'r')
hold on
h1=plot(timevec_RT,lMeanTraceTrl_RThR1_d1,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lMeanTraceTrl_RThR0_d1,'g-','LineWidth',2)
hold on
h3=plot(timevec_RT,lMeanTraceTrl_RTf_d1,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h4=line([0,0],[-0.01,0.1],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.01 0.2]) 
xx=legend([h1 h2 h3], 'HitR1', 'HitR0', 'FA','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Day1 (n = 29 mice)'],'FontSize',20)
h=figure(4)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_30_RO_hit_FA_d1_lick', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close


%% fig3_31 first 30 vs. last 30 trials

meandFF0hR1_d1_head=mean(meandFF0hR1_head_all(1:end,:),1);
stddFF0hR1_d1_head=std(meandFF0hR1_head_all(1:end,:),1,1);
meandFF0hR0_d1_head=mean(meandFF0hR0_head_all(1:end,:),1);
stddFF0hR0_d1_head=std(meandFF0hR0_head_all(1:end,:),1,1);

%% Hit vs. RO, First vs. Last 30 trials
meandFF0hR1_d1_tail=mean(meandFF0hR1_tail_all(1:end,:),1);
stddFF0hR1_d1_tail=std(meandFF0hR1_tail_all(1:end,:),1,1);
meandFF0hR0_d1_tail=mean(meandFF0hR0_tail_all(1:end,:),1);
stddFF0hR0_d1_tail=std(meandFF0hR0_tail_all(1:end,:),1,1);

lTraceTrlhR1_d1_head=mean(lTraceTrlhR1_head_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrlhR1_d1_head=std(lTraceTrlhR1_head_all(1:length(RO_task.mice_NO),:),1,1);
lTraceTrlhR0_d1_head=mean(lTraceTrlhR0_head_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrlhR0_d1_head=std(lTraceTrlhR0_head_all(1:length(RO_task.mice_NO),:),1,1);

lTraceTrlhR1_d1_tail=mean(lTraceTrlhR1_tail_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrlhR1_d1_tail=std(lTraceTrlhR1_tail_all(1:length(RO_task.mice_NO),:),1,1);
lTraceTrlhR0_d1_tail=mean(lTraceTrlhR0_tail_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrlhR0_d1_tail=std(lTraceTrlhR0_tail_all(1:length(RO_task.mice_NO),:),1,1);


figure(5)
boundedline(timevec_RT,meandFF0hR1_d1_head,stddFF0hR1_d1_head./sqrt(length(RO_task.mice_NO)),'b')
hold on
boundedline(timevec_RT,meandFF0hR1_d1_tail,stddFF0hR1_d1_tail./sqrt(length(RO_task.mice_NO)),'r')
hold on
h1=plot(timevec_RT,meandFF0hR1_d1_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0hR1_d1_tail,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.03]) 
xx=legend([h1 h2 h3], 'First 30 trials', 'Last 30 trials','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Hit R1 trials (n = 29 mice)'],'FontSize',20)
h=figure(5)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_31_RO_hit_R1_d1_dLight_Hit30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

figure(6)
boundedline(timevec_RT,meandFF0hR0_d1_head,stddFF0hR0_d1_head./sqrt(length(RO_task.mice_NO)),'b')
hold on
boundedline(timevec_RT,meandFF0hR0_d1_tail,stddFF0hR0_d1_tail./sqrt(length(RO_task.mice_NO)),'r')
hold on
h1=plot(timevec_RT,meandFF0hR0_d1_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0hR0_d1_tail,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.03]) 
xx=legend([h1 h2 h3], 'First 30 trials', 'Last 30 trials','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Hit R0 trials (n = 29 mice)'],'FontSize',20)
h=figure(6)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_31_R0_hit_R0_d1_dLight_Miss30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI


figure(7)
boundedline(timevec_RT,lTraceTrlhR1_d1_head,stdlTraceTrlhR1_d1_head./sqrt(length(RO_task.mice_NO)),'b')
hold on
boundedline(timevec_RT,lTraceTrlhR1_d1_tail,stdlTraceTrlhR1_d1_tail./sqrt(length(RO_task.mice_NO)),'r')
hold on
h1=plot(timevec_RT,lTraceTrlhR1_d1_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lTraceTrlhR1_d1_tail,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.3]) 
xx=legend([h1 h2 h3], 'First 30 trials', 'Last 30 trials','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Hit R1 trials (n = 29 mice)'],'FontSize',20)
h=figure(7)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_31_RO_hit_R1_d1_lick_Hit30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

figure(8)
boundedline(timevec_RT,lTraceTrlhR0_d1_head,stdlTraceTrlhR0_d1_head./sqrt(length(RO_task.mice_NO)),'b')
hold on
boundedline(timevec_RT,lTraceTrlhR0_d1_tail,stdlTraceTrlhR0_d1_tail./sqrt(length(RO_task.mice_NO)),'r')
hold on
h1=plot(timevec_RT,lTraceTrlhR0_d1_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lTraceTrlhR0_d1_tail,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.3]) 
xx=legend([h1 h2 h3], 'First 30 trials', 'Last 30 trials','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Hit R0 trials (n = 29 mice)'],'FontSize',20)
h=figure(8)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_31_RO_hit_R0_d1_lick_Miss30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI


%% Hit vs. FA, First vs. Last 30 trials
meandFF0_RThR1_d1_head=mean(meandFF0_RThR1_head_all(1:end,:),1);
stddFF0_RThR1_d1_head=std(meandFF0_RThR1_head_all(1:end,:),1,1);
meandFF0_RThR0_d1_head=mean(meandFF0_RThR0_head_all(1:end,:),1);
stddFF0_RThR0_d1_head=std(meandFF0_RThR0_head_all(1:end,:),1,1);

meandFF0_RThR1_d1_tail=mean(meandFF0_RThR1_tail_all(1:end,:),1);
stddFF0_RThR1_d1_tail=std(meandFF0_RThR1_tail_all(1:end,:),1,1);
meandFF0_RThR0_d1_tail=mean(meandFF0_RThR0_tail_all(1:end,:),1);
stddFF0_RThR0_d1_tail=std(meandFF0_RThR0_tail_all(1:end,:),1,1);

lTraceTrl_RThR1_d1_head=mean(lTraceTrl_RThR1_head_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrl_RThR1_d1_head=std(lTraceTrl_RThR1_head_all(1:length(RO_task.mice_NO),:),1,1);
lTraceTrl_RThR0_d1_head=mean(lTraceTrl_RThR0_head_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrl_RThR0_d1_head=std(lTraceTrl_RThR0_head_all(1:length(RO_task.mice_NO),:),1,1);

lTraceTrl_RThR1_d1_tail=mean(lTraceTrl_RThR1_tail_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrl_RThR1_d1_tail=std(lTraceTrl_RThR1_tail_all(1:length(RO_task.mice_NO),:),1,1);
lTraceTrl_RThR0_d1_tail=mean(lTraceTrl_RThR0_tail_all(1:length(RO_task.mice_NO),:),1);
stdlTraceTrl_RThR0_d1_tail=std(lTraceTrl_RThR0_tail_all(1:length(RO_task.mice_NO),:),1,1);

figure(9)
boundedline(timevec_RT,meandFF0_RThR1_d1_head,stddFF0_RThR1_d1_head./sqrt(length(RO_task.mice_NO)),'b')
hold on
boundedline(timevec_RT,meandFF0_RThR1_d1_tail,stddFF0_RThR1_d1_tail./sqrt(length(RO_task.mice_NO)),'r')
hold on
h1=plot(timevec_RT,meandFF0_RThR1_d1_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RThR1_d1_tail,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.03]) 
xx=legend([h1 h2 h3], 'First 30 trials', 'Last 30 trials','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Hit R1 trials (n = 29 mice)'],'FontSize',20)
h=figure(9)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_31_RO_hit_R1_d1_dLight_Hit30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

figure(10)
boundedline(timevec_RT,meandFF0_RThR0_d1_head,stddFF0_RThR0_d1_head./sqrt(length(RO_task.mice_NO)),'b')
hold on
boundedline(timevec_RT,meandFF0_RThR0_d1_tail,stddFF0_RThR0_d1_tail./sqrt(length(RO_task.mice_NO)),'r')
hold on
h1=plot(timevec_RT,meandFF0_RThR0_d1_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RThR0_d1_tail,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.03]) 
xx=legend([h1 h2 h3], 'First 30 trials', 'Last 30 trials','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Hit R0 trials (n = 29 mice)'],'FontSize',20)
h=figure(10)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_31_RO_hit_R0_d1_dLight_FA30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

figure(11)
boundedline(timevec_RT,lTraceTrl_RThR1_d1_head,stdlTraceTrl_RThR1_d1_head./sqrt(length(RO_task.mice_NO)),'b')
hold on
boundedline(timevec_RT,lTraceTrl_RThR1_d1_tail,stdlTraceTrl_RThR1_d1_tail./sqrt(length(RO_task.mice_NO)),'r')
hold on
h1=plot(timevec_RT,lTraceTrl_RThR1_d1_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lTraceTrl_RThR1_d1_tail,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.3]) 
xx=legend([h1 h2 h3], 'First 30 trials', 'Last 30 trials','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Hit R1 trials (n = 29 mice)'],'FontSize',20)
h=figure(11)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_31_RO_hit_R1_d1_lick_Hit30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

figure(12)
boundedline(timevec_RT,lTraceTrl_RThR0_d1_head,stdlTraceTrl_RThR0_d1_head./sqrt(length(RO_task.mice_NO)),'b')
hold on
boundedline(timevec_RT,lTraceTrl_RThR0_d1_tail,stdlTraceTrl_RThR0_d1_tail./sqrt(length(RO_task.mice_NO)),'r')
hold on
h1=plot(timevec_RT,lTraceTrl_RThR0_d1_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lTraceTrl_RThR0_d1_tail,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.3]) 
xx=legend([h1 h2 h3], 'First 30 trials', 'Last 30 trials','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Hit R0 trials (n = 29 mice)'],'FontSize',20)
h=figure(12)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_31_RO_hit_R0_d1_lick_FA30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI



toc