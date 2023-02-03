tic
clear all
clc

cd(fileparts(matlab.desktop.editor.getActiveFilename))
addpath ([(fileparts(matlab.desktop.editor.getActiveFilename)) '\boundedline'])
addpath ([(fileparts(matlab.desktop.editor.getActiveFilename)) '\Inpaint_nans'])
load('DT_task_data_struct_single.mat')%load database file

%% fig3_27 plotting of hit vs. miss trials in DT day 1-2-3

warning('off','all')
SR=1000;

meandFF0_RTh_all=zeros(length(DT_task.mice_NO),6*SR+1);
meandFF0_RTf_all=zeros(length(DT_task.mice_NO),6*SR+1);
lMeanTraceTrl_RTh_all=zeros(length(DT_task.mice_NO),6*SR+1);
lMeanTraceTrl_RTf_all=zeros(length(DT_task.mice_NO),6*SR+1);

meandFF0_RTh_head_all=zeros(length(DT_task.mice_NO),6*SR+1);
meandFF0_RTf_head_all=zeros(length(DT_task.mice_NO),6*SR+1);
meandFF0_RTh_tail_all=zeros(length(DT_task.mice_NO),6*SR+1);
meandFF0_RTf_tail_all=zeros(length(DT_task.mice_NO),6*SR+1);
lTraceTrl_RTh_head_all=zeros(length(DT_task.mice_NO),6*SR+1);
lTraceTrl_RTf_head_all=zeros(length(DT_task.mice_NO),6*SR+1);
lTraceTrl_RTh_tail_all=zeros(length(DT_task.mice_NO),6*SR+1);
lTraceTrl_RTf_tail_all=zeros(length(DT_task.mice_NO),6*SR+1);

meandFF0h_all=zeros(length(DT_task.mice_NO),6*SR+1);
meandFF0m_all=zeros(length(DT_task.mice_NO),6*SR+1);
lMeanTraceTrlh_all=zeros(length(DT_task.mice_NO),6*SR+1);
lMeanTraceTrlm_all=zeros(length(DT_task.mice_NO),6*SR+1);

meandFF0h_head_all=zeros(length(DT_task.mice_NO),6*SR+1);
meandFF0m_head_all=zeros(length(DT_task.mice_NO),6*SR+1);
meandFF0h_tail_all=zeros(length(DT_task.mice_NO),6*SR+1);
meandFF0m_tail_all=zeros(length(DT_task.mice_NO),6*SR+1);
lTraceTrlh_head_all=zeros(length(DT_task.mice_NO),6*SR+1);
lTraceTrlm_head_all=zeros(length(DT_task.mice_NO),6*SR+1);
lTraceTrlh_tail_all=zeros(length(DT_task.mice_NO),6*SR+1);
lTraceTrlm_tail_all=zeros(length(DT_task.mice_NO),6*SR+1);

for j = 1:length(DT_task.mice_NO)
    database_DT_calc
    meandFF0h_all(j,:)=meandFF0h;
    meandFF0m_all(j,:)=meandFF0m;
    lMeanTraceTrlh_all(j,:)=lMeanTraceTrlh;
    lMeanTraceTrlm_all(j,:)=lMeanTraceTrlm;
    meandFF0h_head_all(j,:)=meandFF0h_head;
    meandFF0h_tail_all(j,:)=meandFF0h_tail;
    meandFF0m_head_all(j,:)=meandFF0m_head;
    meandFF0m_tail_all(j,:)=meandFF0m_tail;
    lTraceTrlh_head_all(j,:)=lTraceTrlh_head;
    lTraceTrlh_tail_all(j,:)=lTraceTrlh_tail;
    lTraceTrlm_head_all(j,:)=lTraceTrlm_head;
    lTraceTrlm_tail_all(j,:)=lTraceTrlm_tail;
    meandFF0_RTh_all(j,:)=meandFF0_RTh;
    meandFF0_RTf_all(j,:)=meandFF0_RTf;
    lMeanTraceTrl_RTh_all(j,:)=lMeanTraceTrl_RTh;
    lMeanTraceTrl_RTf_all(j,:)=lMeanTraceTrl_RTf;
    meandFF0_RTh_head_all(j,:)=meandFF0_RTh_head;
    meandFF0_RTh_tail_all(j,:)=meandFF0_RTh_tail;
    meandFF0_RTf_head_all(j,:)=meandFF0_RTf_head;
    meandFF0_RTf_tail_all(j,:)=meandFF0_RTf_tail;
    lTraceTrl_RTh_head_all(j,:)=lTraceTrl_RTh_head;
    lTraceTrl_RTh_tail_all(j,:)=lTraceTrl_RTh_tail;
    lTraceTrl_RTf_head_all(j,:)=lTraceTrl_RTf_head;
    lTraceTrl_RTf_tail_all(j,:)=lTraceTrl_RTf_tail;
end

%dLight trace calculations
meandFF0h_d1=mean(meandFF0h_all(1:3:length(DT_task.mice_NO),:),1);
stddFF0h_d1=std(meandFF0h_all(1:3:length(DT_task.mice_NO),:),1,1);
meandFF0m_d1=mean(meandFF0m_all(1:3:length(DT_task.mice_NO),:),1);
stddFF0m_d1=std(meandFF0m_all(1:3:length(DT_task.mice_NO),:),1,1);

meandFF0h_d2=mean(meandFF0h_all(2:3:length(DT_task.mice_NO),:),1);
stddFF0h_d2=std(meandFF0h_all(2:3:length(DT_task.mice_NO),:),1,1);
meandFF0m_d2=mean(meandFF0m_all(2:3:length(DT_task.mice_NO),:),1);
stddFF0m_d2=std(meandFF0m_all(2:3:length(DT_task.mice_NO),:),1,1);

meandFF0h_d3=mean(meandFF0h_all(3:3:length(DT_task.mice_NO),:),1);
stddFF0h_d3=std(meandFF0h_all(3:3:length(DT_task.mice_NO),:),1,1);
meandFF0m_d3=mean(meandFF0m_all(3:3:length(DT_task.mice_NO),:),1);
stddFF0m_d3=std(meandFF0m_all(3:3:length(DT_task.mice_NO),:),1,1);

%licking trace calculations
lMeanTraceTrlh_d1=mean(lMeanTraceTrlh_all(1:3:length(DT_task.mice_NO),:),1);
stdlTraceTrlh_d1=std(lMeanTraceTrlh_all(1:3:length(DT_task.mice_NO),:),1,1);
lMeanTraceTrlm_d1=mean(lMeanTraceTrlm_all(1:3:length(DT_task.mice_NO),:),1);
stdlTraceTrlm_d1=std(lMeanTraceTrlm_all(1:3:length(DT_task.mice_NO),:),1,1);

lMeanTraceTrlh_d2=mean(lMeanTraceTrlh_all(2:3:length(DT_task.mice_NO),:),1);
stdlTraceTrlh_d2=std(lMeanTraceTrlh_all(2:3:length(DT_task.mice_NO),:),1,1);
lMeanTraceTrlm_d2=mean(lMeanTraceTrlm_all(2:3:length(DT_task.mice_NO),:),1);
stdlTraceTrlm_d2=std(lMeanTraceTrlm_all(2:3:length(DT_task.mice_NO),:),1,1);

lMeanTraceTrlh_d3=mean(lMeanTraceTrlh_all(3:3:length(DT_task.mice_NO),:),1);
stdlTraceTrlh_d3=std(lMeanTraceTrlh_all(3:3:length(DT_task.mice_NO),:),1,1);
lMeanTraceTrlm_d3=mean(lMeanTraceTrlm_all(3:3:length(DT_task.mice_NO),:),1);
stdlTraceTrlm_d3=std(lMeanTraceTrlm_all(3:3:length(DT_task.mice_NO),:),1,1);

figure(1)
boundedline(timevec_RT,meandFF0h_d1,stddFF0h_d1./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,meandFF0m_d1,stddFF0m_d1./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,meandFF0h_d1,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0m_d1,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.02]) 
xx=legend([h1 h2 h3], 'Hit', 'Miss','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Day1 (n = 41 mice)'],'FontSize',20)
h=figure(1)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_27_DT_hit_miss_d1_dLight', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

figure(2)
boundedline(timevec_RT,lMeanTraceTrlh_d1,stdlTraceTrlh_d1./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,lMeanTraceTrlm_d1,stdlTraceTrlm_d1./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,lMeanTraceTrlh_d1,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lMeanTraceTrlm_d1,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.01 0.2]) 
xx=legend([h1 h2 h3], 'Hit', 'Miss','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Day1 (n = 41 mice)'],'FontSize',20)
h=figure(2)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_27_DT_hit_miss_d1_lick', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

figure(3)
boundedline(timevec_RT,meandFF0h_d2,stddFF0h_d2./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,meandFF0m_d2,stddFF0m_d2./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,meandFF0h_d2,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0m_d2,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.02]) 
xx=legend([h1 h2 h3], 'Hit', 'Miss','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Day2 (n = 41 mice)'],'FontSize',20)
h=figure(3)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_27_DT_hit_miss_d2_dLight', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

figure(4)
boundedline(timevec_RT,lMeanTraceTrlh_d2,stdlTraceTrlh_d2./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,lMeanTraceTrlm_d2,stdlTraceTrlm_d2./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,lMeanTraceTrlh_d2,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lMeanTraceTrlm_d2,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.01 0.2]) 
xx=legend([h1 h2 h3], 'Hit', 'Miss','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Day2 (n = 41 mice)'],'FontSize',20)
h=figure(4)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_27_DT_hit_miss_d2_lick', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

figure(5)
boundedline(timevec_RT,meandFF0h_d3,stddFF0h_d3./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,meandFF0m_d3,stddFF0m_d3./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,meandFF0h_d3,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0m_d3,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.02]) 
xx=legend([h1 h2 h3], 'Hit', 'Miss','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Day3 (n = 41 mice)'],'FontSize',20)
h=figure(5)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_27_DT_hit_miss_d3_dLight', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

figure(6)
boundedline(timevec_RT,lMeanTraceTrlh_d3,stdlTraceTrlh_d3./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,lMeanTraceTrlm_d3,stdlTraceTrlm_d3./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,lMeanTraceTrlh_d3,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lMeanTraceTrlm_d3,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.01 0.2]) 
xx=legend([h1 h2 h3], 'Hit', 'Miss','Whisker On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Day3 (n = 41 mice)'],'FontSize',20)
h=figure(6)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_27_DT_hit_miss_d3_lick', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

%% Hit vs. FA on Day 1-2-3

%dLight trace calculations_lick aligned
meandFF0_RTh_d1=mean(meandFF0_RTh_all(1:3:length(DT_task.mice_NO),:),1);
stddFF0_RTh_d1=std(meandFF0_RTh_all(1:3:length(DT_task.mice_NO),:),1,1);
meandFF0_RTf_d1=mean(meandFF0_RTf_all(1:3:length(DT_task.mice_NO),:),1);
stddFF0_RTf_d1=std(meandFF0_RTf_all(1:3:length(DT_task.mice_NO),:),1,1);

meandFF0_RTh_d2=mean(meandFF0_RTh_all(2:3:length(DT_task.mice_NO),:),1);
stddFF0_RTh_d2=std(meandFF0_RTh_all(2:3:length(DT_task.mice_NO),:),1,1);
meandFF0_RTf_d2=mean(meandFF0_RTf_all(2:3:length(DT_task.mice_NO),:),1);
stddFF0_RTf_d2=std(meandFF0_RTf_all(2:3:length(DT_task.mice_NO),:),1,1);

meandFF0_RTh_d3=mean(meandFF0_RTh_all(3:3:length(DT_task.mice_NO),:),1);
stddFF0_RTh_d3=std(meandFF0_RTh_all(3:3:length(DT_task.mice_NO),:),1,1);
meandFF0_RTf_d3=mean(meandFF0_RTf_all(3:3:length(DT_task.mice_NO),:),1);
stddFF0_RTf_d3=std(meandFF0_RTf_all(3:3:length(DT_task.mice_NO),:),1,1);

%licking trace calculations_lick aligned
lMeanTraceTrl_RTh_d1=mean(lMeanTraceTrl_RTh_all(1:3:length(DT_task.mice_NO),:),1);
stdlTraceTrl_RTh_d1=std(lMeanTraceTrl_RTh_all(1:3:length(DT_task.mice_NO),:),1,1);
lMeanTraceTrl_RTf_d1=mean(lMeanTraceTrl_RTf_all(1:3:length(DT_task.mice_NO),:),1);
stdlTraceTrl_RTf_d1=std(lMeanTraceTrl_RTf_all(1:3:length(DT_task.mice_NO),:),1,1);

lMeanTraceTrl_RTh_d2=mean(lMeanTraceTrl_RTh_all(2:3:length(DT_task.mice_NO),:),1);
stdlTraceTrl_RTh_d2=std(lMeanTraceTrl_RTh_all(2:3:length(DT_task.mice_NO),:),1,1);
lMeanTraceTrl_RTf_d2=mean(lMeanTraceTrl_RTf_all(2:3:length(DT_task.mice_NO),:),1);
stdlTraceTrl_RTf_d2=std(lMeanTraceTrl_RTf_all(2:3:length(DT_task.mice_NO),:),1,1);

lMeanTraceTrl_RTh_d3=mean(lMeanTraceTrl_RTh_all(3:3:length(DT_task.mice_NO),:),1);
stdlTraceTrl_RTh_d3=std(lMeanTraceTrl_RTh_all(3:3:length(DT_task.mice_NO),:),1,1);
lMeanTraceTrl_RTf_d3=mean(lMeanTraceTrl_RTf_all(3:3:length(DT_task.mice_NO),:),1);
stdlTraceTrl_RTf_d3=std(lMeanTraceTrl_RTf_all(3:3:length(DT_task.mice_NO),:),1,1);

figure(7)
boundedline(timevec_RT,meandFF0_RTh_d1,stddFF0_RTh_d1./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,meandFF0_RTf_d1,stddFF0_RTf_d1./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,meandFF0_RTh_d1,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RTf_d1,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.02]) 
xx=legend([h1 h2 h3], 'Hit', 'FA','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Day1 (n = 41 mice)'],'FontSize',20)
h=figure(7)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_28_DT_Hit_FA_d1_dLight', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

figure(8)
boundedline(timevec_RT,lMeanTraceTrl_RTh_d1,stdlTraceTrl_RTh_d1./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,lMeanTraceTrl_RTf_d1,stdlTraceTrl_RTf_d1./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,lMeanTraceTrl_RTh_d1,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lMeanTraceTrl_RTf_d1,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.01 0.2]) 
xx=legend([h1 h2 h3], 'Hit', 'FA','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Day1 (n = 41 mice)'],'FontSize',20)
h=figure(8)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_28_DT_Hit_FA_d1_lick', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

figure(9)
boundedline(timevec_RT,meandFF0_RTh_d2,stddFF0_RTh_d2./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,meandFF0_RTf_d2,stddFF0_RTf_d2./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,meandFF0_RTh_d2,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RTf_d2,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.02]) 
xx=legend([h1 h2 h3], 'Hit', 'FA','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Day2 (n = 41 mice)'],'FontSize',20)
h=figure(9)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_28_DT_Hit_FA_d2_dLight', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

figure(10)
boundedline(timevec_RT,lMeanTraceTrl_RTh_d2,stdlTraceTrl_RTh_d2./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,lMeanTraceTrl_RTf_d2,stdlTraceTrl_RTf_d2./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,lMeanTraceTrl_RTh_d2,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lMeanTraceTrl_RTf_d2,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.01 0.2]) 
xx=legend([h1 h2 h3], 'Hit', 'FA','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Day2 (n = 41 mice)'],'FontSize',20)
h=figure(10)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_28_DT_Hit_FA_d2_lick', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close


figure(11)
boundedline(timevec_RT,meandFF0_RTh_d3,stddFF0_RTh_d3./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,meandFF0_RTf_d3,stddFF0_RTf_d3./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,meandFF0_RTh_d3,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RTf_d3,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.02]) 
xx=legend([h1 h2 h3], 'Hit', 'FA','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Day3 (n = 41 mice)'],'FontSize',20)
h=figure(11)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_28_DT_Hit_FA_d3_dLight', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

figure(12)
boundedline(timevec_RT,lMeanTraceTrl_RTh_d3,stdlTraceTrl_RTh_d3./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,lMeanTraceTrl_RTf_d3,stdlTraceTrl_RTf_d3./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,lMeanTraceTrl_RTh_d3,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lMeanTraceTrl_RTf_d3,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2);
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.01 0.2]) 
xx=legend([h1 h2 h3], 'Hit', 'FA','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Day3 (n = 41 mice)'],'FontSize',20)
h=figure(12)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_28_DT_Hit_FA_d3_lick', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close
%% fig3_11 first 30 vs. last 30 trials

meandFF0h_d3_head=mean(meandFF0h_head_all(3:3:end,:),1);
stddFF0h_d3_head=std(meandFF0h_head_all(3:3:end,:),1,1);
meandFF0m_d3_head=mean(meandFF0m_head_all(3:3:end,:),1);
stddFF0m_d3_head=std(meandFF0m_head_all(3:3:end,:),1,1);

%% Hit vs. Miss, First vs. Last 30 trials
meandFF0h_d3_tail=mean(meandFF0h_tail_all(3:3:end,:),1);
stddFF0h_d3_tail=std(meandFF0h_tail_all(3:3:end,:),1,1);
meandFF0m_d3_tail=mean(meandFF0m_tail_all(3:3:end,:),1);
stddFF0m_d3_tail=std(meandFF0m_tail_all(3:3:end,:),1,1);

lTraceTrlh_d3_head=mean(lTraceTrlh_head_all(3:3:length(DT_task.mice_NO),:),1);
stdlTraceTrlh_d3_head=std(lTraceTrlh_head_all(3:3:length(DT_task.mice_NO),:),1,1);
lTraceTrlm_d3_head=mean(lTraceTrlm_head_all(3:3:length(DT_task.mice_NO),:),1);
stdlTraceTrlm_d3_head=std(lTraceTrlm_head_all(3:3:length(DT_task.mice_NO),:),1,1);

lTraceTrlh_d3_tail=mean(lTraceTrlh_tail_all(3:3:length(DT_task.mice_NO),:),1);
stdlTraceTrlh_d3_tail=std(lTraceTrlh_tail_all(3:3:length(DT_task.mice_NO),:),1,1);
lTraceTrlm_d3_tail=mean(lTraceTrlm_tail_all(3:3:length(DT_task.mice_NO),:),1);
stdlTraceTrlm_d3_tail=std(lTraceTrlm_tail_all(3:3:length(DT_task.mice_NO),:),1,1);


figure(13)
boundedline(timevec_RT,meandFF0h_d3_head,stddFF0h_d3_head./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,meandFF0h_d3_tail,stddFF0h_d3_tail./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,meandFF0h_d3_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0h_d3_tail,'r-','LineWidth',2)
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
title(['Hit trials (n = 41 mice)'],'FontSize',20)
h=figure(13)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_29_DT_hit_Miss_d3_dLight_Hit30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

figure(14)
boundedline(timevec_RT,meandFF0m_d3_head,stddFF0m_d3_head./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,meandFF0m_d3_tail,stddFF0m_d3_tail./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,meandFF0m_d3_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0m_d3_tail,'r-','LineWidth',2)
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
title(['Miss trials (n = 41 mice)'],'FontSize',20)
h=figure(14)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_29_DT_hit_Miss_d3_dLight_Miss30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI


figure(15)
boundedline(timevec_RT,lTraceTrlh_d3_head,stdlTraceTrlh_d3_head./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,lTraceTrlh_d3_tail,stdlTraceTrlh_d3_tail./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,lTraceTrlh_d3_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lTraceTrlh_d3_tail,'r-','LineWidth',2)
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
title(['Hit trials (n = 41 mice)'],'FontSize',20)
h=figure(15)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_29_DT_hit_Miss_d3_lick_Hit30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

figure(16)
boundedline(timevec_RT,lTraceTrlm_d3_head,stdlTraceTrlm_d3_head./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,lTraceTrlm_d3_tail,stdlTraceTrlm_d3_tail./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,lTraceTrlm_d3_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lTraceTrlm_d3_tail,'r-','LineWidth',2)
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
title(['Miss trials (n = 41 mice)'],'FontSize',20)
h=figure(16)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_29_DT_hit_Miss_d3_lick_Miss30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI


%% Hit vs. FA, First vs. Last 30 trials
meandFF0_RTh_d3_head=mean(meandFF0_RTh_head_all(3:3:end,:),1);
stddFF0_RTh_d3_head=std(meandFF0_RTh_head_all(3:3:end,:),1,1);
meandFF0_RTf_d3_head=mean(meandFF0_RTf_head_all(3:3:end,:),1);
stddFF0_RTf_d3_head=std(meandFF0_RTf_head_all(3:3:end,:),1,1);

meandFF0_RTh_d3_tail=mean(meandFF0_RTh_tail_all(3:3:end,:),1);
stddFF0_RTh_d3_tail=std(meandFF0_RTh_tail_all(3:3:end,:),1,1);
meandFF0_RTf_d3_tail=mean(meandFF0_RTf_tail_all(3:3:end,:),1);
stddFF0_RTf_d3_tail=std(meandFF0_RTf_tail_all(3:3:end,:),1,1);

lTraceTrl_RTh_d3_head=mean(lTraceTrl_RTh_head_all(3:3:length(DT_task.mice_NO),:),1);
stdlTraceTrl_RTh_d3_head=std(lTraceTrl_RTh_head_all(3:3:length(DT_task.mice_NO),:),1,1);
lTraceTrl_RTf_d3_head=mean(lTraceTrl_RTf_head_all(3:3:length(DT_task.mice_NO),:),1);
stdlTraceTrl_RTf_d3_head=std(lTraceTrl_RTf_head_all(3:3:length(DT_task.mice_NO),:),1,1);

lTraceTrl_RTh_d3_tail=mean(lTraceTrl_RTh_tail_all(3:3:length(DT_task.mice_NO),:),1);
stdlTraceTrl_RTh_d3_tail=std(lTraceTrl_RTh_tail_all(3:3:length(DT_task.mice_NO),:),1,1);
lTraceTrl_RTf_d3_tail=mean(lTraceTrl_RTf_tail_all(3:3:length(DT_task.mice_NO),:),1);
stdlTraceTrl_RTf_d3_tail=std(lTraceTrl_RTf_tail_all(3:3:length(DT_task.mice_NO),:),1,1);

figure(17)
boundedline(timevec_RT,meandFF0_RTh_d3_head,stddFF0_RTh_d3_head./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,meandFF0_RTh_d3_tail,stddFF0_RTh_d3_tail./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,meandFF0_RTh_d3_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RTh_d3_tail,'r-','LineWidth',2)
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
title(['Hit trials (n = 41 mice)'],'FontSize',20)
h=figure(17)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_29_DT_hit_FA_d3_dLight_Hit30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

figure(18)
boundedline(timevec_RT,meandFF0_RTf_d3_head,stddFF0_RTf_d3_head./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,meandFF0_RTf_d3_tail,stddFF0_RTf_d3_tail./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,meandFF0_RTf_d3_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RTf_d3_tail,'r-','LineWidth',2)
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
title(['FA trials (n = 41 mice)'],'FontSize',20)
h=figure(18)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_29_DT_hit_FA_d3_dLight_FA30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI


figure(19)
boundedline(timevec_RT,lTraceTrl_RTh_d3_head,stdlTraceTrl_RTh_d3_head./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,lTraceTrl_RTh_d3_tail,stdlTraceTrl_RTh_d3_tail./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,lTraceTrl_RTh_d3_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lTraceTrl_RTh_d3_tail,'r-','LineWidth',2)
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
title(['Hit trials (n = 41 mice)'],'FontSize',20)
h=figure(19)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_29_DT_hit_FA_d3_lick_Hit30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

figure(20)
boundedline(timevec_RT,lTraceTrl_RTf_d3_head,stdlTraceTrl_RTf_d3_head./sqrt(length(DT_task.mice_NO)/3),'b')
hold on
boundedline(timevec_RT,lTraceTrl_RTf_d3_tail,stdlTraceTrl_RTf_d3_tail./sqrt(length(DT_task.mice_NO)/3),'r')
hold on
h1=plot(timevec_RT,lTraceTrl_RTf_d3_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lTraceTrl_RTf_d3_tail,'r-','LineWidth',2)
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
title(['FA trials (n = 41 mice)'],'FontSize',20)
h=figure(20)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_29_DT_hit_FA_d3_lick_FA30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI








toc