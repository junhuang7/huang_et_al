tic
clear all
clc

cd(fileparts(matlab.desktop.editor.getActiveFilename))
addpath ([(fileparts(matlab.desktop.editor.getActiveFilename)) '\boundedline'])
addpath ([(fileparts(matlab.desktop.editor.getActiveFilename)) '\Inpaint_nans'])
load('FL_task_data_struct_single.mat')%load database file

%% figure 3.7 in the thesis 

warning('off','all')
SR=1000;
meandFF0_RTh_all=zeros(length(FL_task.mice_NO),6*SR+1);
meandFF0_RTf_all=zeros(length(FL_task.mice_NO),6*SR+1);
lMeanTraceTrl_RTh_all=zeros(length(FL_task.mice_NO),6*SR+1);
lMeanTraceTrl_RTf_all=zeros(length(FL_task.mice_NO),6*SR+1);

meandFF0_RTh_head_all=zeros(length(FL_task.mice_NO),6*SR+1);
meandFF0_RTf_head_all=zeros(length(FL_task.mice_NO),6*SR+1);
meandFF0_RTh_tail_all=zeros(length(FL_task.mice_NO),6*SR+1);
meandFF0_RTf_tail_all=zeros(length(FL_task.mice_NO),6*SR+1);
lTraceTrl_RTh_head_all=zeros(length(FL_task.mice_NO),6*SR+1);
lTraceTrl_RTf_head_all=zeros(length(FL_task.mice_NO),6*SR+1);
lTraceTrl_RTh_tail_all=zeros(length(FL_task.mice_NO),6*SR+1);
lTraceTrl_RTf_tail_all=zeros(length(FL_task.mice_NO),6*SR+1);

for j = 1:length(FL_task.mice_NO)
    database_FL_calc
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
meandFF0_RTh_d1=mean(meandFF0_RTh_all(1:2:length(FL_task.mice_NO),:),1);
stddFF0_RTh_d1=std(meandFF0_RTh_all(1:2:length(FL_task.mice_NO),:),1,1);
meandFF0_RTf_d1=mean(meandFF0_RTf_all(1:2:length(FL_task.mice_NO),:),1);
stddFF0_RTf_d1=std(meandFF0_RTf_all(1:2:length(FL_task.mice_NO),:),1,1);

meandFF0_RTh_d2=mean(meandFF0_RTh_all(2:2:length(FL_task.mice_NO),:),1);
stddFF0_RTh_d2=std(meandFF0_RTh_all(2:2:length(FL_task.mice_NO),:),1,1);
meandFF0_RTf_d2=mean(meandFF0_RTf_all(2:2:length(FL_task.mice_NO),:),1);
stddFF0_RTf_d2=std(meandFF0_RTf_all(2:2:length(FL_task.mice_NO),:),1,1);

%licking trace calculations
lMeanTraceTrl_RTh_d1=mean(lMeanTraceTrl_RTh_all(1:2:length(FL_task.mice_NO),:),1);
stdlTraceTrl_RTh_d1=std(lMeanTraceTrl_RTh_all(1:2:length(FL_task.mice_NO),:),1,1);
lMeanTraceTrl_RTf_d1=mean(lMeanTraceTrl_RTf_all(1:2:length(FL_task.mice_NO),:),1);
stdlTraceTrl_RTf_d1=std(lMeanTraceTrl_RTf_all(1:2:length(FL_task.mice_NO),:),1,1);

lMeanTraceTrl_RTh_d2=mean(lMeanTraceTrl_RTh_all(2:2:length(FL_task.mice_NO),:),1);
stdlTraceTrl_RTh_d2=std(lMeanTraceTrl_RTh_all(2:2:length(FL_task.mice_NO),:),1,1);
lMeanTraceTrl_RTf_d2=mean(lMeanTraceTrl_RTf_all(2:2:length(FL_task.mice_NO),:),1);
stdlTraceTrl_RTf_d2=std(lMeanTraceTrl_RTf_all(2:2:length(FL_task.mice_NO),:),1,1);


%% fig3_7 plotting of R+ vs. R- trials in free-licking day 2

figure(1)
boundedline(timevec_RT,meandFF0_RTh_d2,stddFF0_RTh_d2./sqrt(length(FL_task.mice_NO)/2),'b')
hold on
boundedline(timevec_RT,meandFF0_RTf_d2,stddFF0_RTf_d2./sqrt(length(FL_task.mice_NO)/2),'r')
hold on
h1=plot(timevec_RT,meandFF0_RTh_d2,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RTf_d2,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2,'DisplayName','Lick On');
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.02]) 
xx=legend([h1 h2 h3], 'R+', 'R-','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Day2 (n = 41 mice)'],'FontSize',20)
h=figure(1)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_7_FL_R+_R-_d2_dLight', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

figure(2)
boundedline(timevec_RT,lMeanTraceTrl_RTh_d2,stdlTraceTrl_RTh_d2./sqrt(length(FL_task.mice_NO)/2),'b')
hold on
boundedline(timevec_RT,lMeanTraceTrl_RTf_d2,stdlTraceTrl_RTf_d2./sqrt(length(FL_task.mice_NO)/2),'r')
hold on
h1=plot(timevec_RT,lMeanTraceTrl_RTh_d2,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lMeanTraceTrl_RTf_d2,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2,'DisplayName','Lick On');
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.01 0.2]) 
xx=legend([h1 h2 h3], 'R+', 'R-','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['Day2 (n = 41 mice)'],'FontSize',20)
h=figure(2)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_7_FL_R+_R-_d2_lick', '-dpng', '-r300'); %<-Save as PNG with 300 DPI
% close

%% fig3_9 sucrose reward vs. water reward

% dLight trace calculations
% Since the first 33 animals are sucrose-rewarded, and the rest 8 animals
% are water rewarded, so we are going to divide the two groups based on the
% index of the array.

meandFF0_RTh_d2_suc=mean(meandFF0_RTh_all(2:2:33*2,:),1);
stddFF0_RTh_d2_suc=std(meandFF0_RTh_all(2:2:33*2,:),1,1);
meandFF0_RTf_d2_suc=mean(meandFF0_RTf_all(2:2:33*2,:),1);
stddFF0_RTf_d2_suc=std(meandFF0_RTf_all(2:2:33*2,:),1,1);

meandFF0_RTh_d2_water=mean(meandFF0_RTh_all(34*2:2:end,:),1);
stddFF0_RTh_d2_water=std(meandFF0_RTh_all(34*2:2:end,:),1,1);
meandFF0_RTf_d2_water=mean(meandFF0_RTf_all(34*2:2:end,:),1);
stddFF0_RTf_d2_water=std(meandFF0_RTf_all(34*2:2:end,:),1,1);

figure(3)
boundedline(timevec_RT,meandFF0_RTh_d2_suc,stddFF0_RTh_d2_suc./sqrt(33),'b')
hold on
boundedline(timevec_RT,meandFF0_RTf_d2_suc,stddFF0_RTf_d2_suc./sqrt(33),'r')
hold on
h1=plot(timevec_RT,meandFF0_RTh_d2_suc,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RTf_d2_suc,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2,'DisplayName','Lick On');
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.02]) 
xx=legend([h1 h2 h3], 'R+', 'R-','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Sucrose (n=33)'],'FontSize',20)
h=figure(3)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_9_FL_R+_R-_d2_dLight_sucrose', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

figure(4)
boundedline(timevec_RT,meandFF0_RTh_d2_water,stddFF0_RTh_d2_water./sqrt(8),'b')
hold on
boundedline(timevec_RT,meandFF0_RTf_d2_water,stddFF0_RTf_d2_water./sqrt(8),'r')
hold on
h1=plot(timevec_RT,meandFF0_RTh_d2_water,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RTf_d2_water,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2,'DisplayName','Lick On');
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.02]) 
xx=legend([h1 h2 h3], 'R+', 'R-','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['Water (n=8)'],'FontSize',20)
h=figure(4)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_9_FL_R+_R-_d2_dLight_water', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

%% fig3_11 first 30 vs. last 30 trials


meandFF0_RTh_d2_head=mean(meandFF0_RTh_head_all(2:2:end,:),1);
stddFF0_RTh_d2_head=std(meandFF0_RTh_head_all(2:2:end,:),1,1);
meandFF0_RTf_d2_head=mean(meandFF0_RTf_head_all(2:2:end,:),1);
stddFF0_RTf_d2_head=std(meandFF0_RTf_head_all(2:2:end,:),1,1);

meandFF0_RTh_d2_tail=mean(meandFF0_RTh_tail_all(2:2:end,:),1);
stddFF0_RTh_d2_tail=std(meandFF0_RTh_tail_all(2:2:end,:),1,1);
meandFF0_RTf_d2_tail=mean(meandFF0_RTf_tail_all(2:2:end,:),1);
stddFF0_RTf_d2_tail=std(meandFF0_RTf_tail_all(2:2:end,:),1,1);

lTraceTrl_RTh_d2_head=mean(lTraceTrl_RTh_head_all(2:2:length(FL_task.mice_NO),:),1);
stdlTraceTrl_RTh_d2_head=std(lTraceTrl_RTh_head_all(2:2:length(FL_task.mice_NO),:),1,1);
lTraceTrl_RTf_d2_head=mean(lTraceTrl_RTf_head_all(2:2:length(FL_task.mice_NO),:),1);
stdlTraceTrl_RTf_d2_head=std(lTraceTrl_RTf_head_all(2:2:length(FL_task.mice_NO),:),1,1);

lTraceTrl_RTh_d2_tail=mean(lTraceTrl_RTh_tail_all(2:2:length(FL_task.mice_NO),:),1);
stdlTraceTrl_RTh_d2_tail=std(lTraceTrl_RTh_tail_all(2:2:length(FL_task.mice_NO),:),1,1);
lTraceTrl_RTf_d2_tail=mean(lTraceTrl_RTf_tail_all(2:2:length(FL_task.mice_NO),:),1);
stdlTraceTrl_RTf_d2_tail=std(lTraceTrl_RTf_tail_all(2:2:length(FL_task.mice_NO),:),1,1);


figure(5)
boundedline(timevec_RT,meandFF0_RTh_d2_head,stddFF0_RTh_d2_head./sqrt(length(FL_task.mice_NO)/2),'b')
hold on
boundedline(timevec_RT,meandFF0_RTh_d2_tail,stddFF0_RTh_d2_tail./sqrt(length(FL_task.mice_NO)/2),'r')
hold on
h1=plot(timevec_RT,meandFF0_RTh_d2_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RTh_d2_tail,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2,'DisplayName','Lick On');
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.03]) 
xx=legend([h1 h2 h3], 'First 30 trials', 'Last 30 trials','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['R+ trials (n = 41 mice)'],'FontSize',20)
h=figure(5)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_11_FL_R+_R-_d2_dLight_R+30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

figure(6)
boundedline(timevec_RT,meandFF0_RTf_d2_head,stddFF0_RTf_d2_head./sqrt(length(FL_task.mice_NO)/2),'b')
hold on
boundedline(timevec_RT,meandFF0_RTf_d2_tail,stddFF0_RTf_d2_tail./sqrt(length(FL_task.mice_NO)/2),'r')
hold on
h1=plot(timevec_RT,meandFF0_RTf_d2_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,meandFF0_RTf_d2_tail,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.01],'color','black','linewidth',2,'DisplayName','Lick On');
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.03]) 
xx=legend([h1 h2 h3], 'First 30 trials', 'Last 30 trials','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('\DeltaF/F_0','FontSize',20)
title(['R- trials (n = 41 mice)'],'FontSize',20)
h=figure(6)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_11_FL_R+_R-_d2_dLight_R-30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI



figure(7)
boundedline(timevec_RT,lTraceTrl_RTh_d2_head,stdlTraceTrl_RTh_d2_head./sqrt(length(FL_task.mice_NO)/2),'b')
hold on
boundedline(timevec_RT,lTraceTrl_RTh_d2_tail,stdlTraceTrl_RTh_d2_tail./sqrt(length(FL_task.mice_NO)/2),'r')
hold on
h1=plot(timevec_RT,lTraceTrl_RTh_d2_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lTraceTrl_RTh_d2_tail,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2,'DisplayName','Lick On');
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.3]) 
xx=legend([h1 h2 h3], 'First 30 trials', 'Last 30 trials','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['R+ trials (n = 41 mice)'],'FontSize',20)
h=figure(7)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_11_FL_R+_R-_d2_lick_R+30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI

figure(8)
boundedline(timevec_RT,lTraceTrl_RTf_d2_head,stdlTraceTrl_RTf_d2_head./sqrt(length(FL_task.mice_NO)/2),'b')
hold on
boundedline(timevec_RT,lTraceTrl_RTf_d2_tail,stdlTraceTrl_RTf_d2_tail./sqrt(length(FL_task.mice_NO)/2),'r')
hold on
h1=plot(timevec_RT,lTraceTrl_RTf_d2_head,'b-','LineWidth',2)
hold on
h2=plot(timevec_RT,lTraceTrl_RTf_d2_tail,'r-','LineWidth',2)
lgd = legend;
lgd.NumColumns = 1;
hold on
h3=line([0,0],[-0.01,0.1],'color','black','linewidth',2,'DisplayName','Lick On');
set(gca,'xtick',(-3:3))
set(gca,'xticklabel',num2cell(-3:3),'FontSize',20)
set(gca,'box','off')
legend boxoff 
ylim([-0.0149 0.3]) 
xx=legend([h1 h2 h3], 'First 30 trials', 'Last 30 trials','Lick On');
set(xx,'FontSize',12);
xlabel('time (sec)','FontSize',20)
ylabel('Lick (A.U.)','FontSize',20)
title(['R- trials (n = 41 mice)'],'FontSize',20)
h=figure(8)
set(h,'PaperSize',[8 6]); %set the paper size to what you want  
print('fig3_11_FL_R+_R-_d2_lick_R-30', '-dpng', '-r300'); %<-Save as PNG with 300 DPI













toc
