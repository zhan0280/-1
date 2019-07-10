%遗传算法求解TSP问题(为选择操作从新设计后程序)
%输入：
%NIND    为种群个数
%MAXGEN  为停止代数，遗传到第MAXGEN代时程序停止,MAXGEN的具体取值视问题的规模和耗费的时间而定
%m       为适值淘汰加速指数,最好取为1,2,3,4,不宜太大
%Pc      交叉概率
%Pm      变异概率
%输出：
%R       为最短路径
%Rlength 为路径长度
clear
clc
close all
%% 加载数据
N=95;    %仓位个数
%% 遗传参数
NIND=100;       %种群大小
MAXGEN=200;     %最大遗传代数
Pc=0.9;         %交叉概率
Pm=0.05;        %变异概率
GGAP=0.9;       %代沟
%% 初始化种群
Chrom=InitPop(NIND,N);
%% 画出随机解的路径图
%DrawPath(Chrom(1,:),X)
%pause(0.0001)
%% 输出随机解的路径和总距离
%disp('初始种群中的一个随机值:')
%OutputPath(Chrom(1,:));
%Rlength=PathLength(D,Chrom(1,:));
%disp(['总距离：',num2str(Rlength)]);
%disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
cangwei=xlsread('C:\Users\a\Desktop\历史数据摆放.xlsx',1,'A2:H96');
leng=[ones(1,45)*9,ones(1,50)*12];
Leng=cangwei(:,2)';
R=cangwei(:,3)';
T=cangwei(:,4)';
Amount=cangwei(:,6)';
maxamount=cangwei(:,5)';
Number=cangwei(:,1)';
zhonglei=cangwei(:,8)';
x = xlsread('C:\Users\a\Desktop\10月结果(1).xlsx',1,'C2:J86');
x2=xlsread('C:\Users\a\Desktop\10月结果(1).xlsx',1,'L2:S86');
x3=xlsread('C:\Users\a\Desktop\70种LRG.xlsx',1,'C3:F72');
%% 优化
gen=0;
figure;
hold on;box on
xlim([0,MAXGEN])
title('优化过程')
xlabel('代数')
ylabel('最优值')
ObjV=PathLength(x,x2,x3,Chrom,leng,Leng,R,T,Amount,maxamount,Number,zhonglei);  %计算路径长度
preObjV=min(ObjV);
ppreObjV=[];FANGAN=[];%记录最好的方案


while gen<MAXGEN+1
    %% 计算适应度
    ObjV=PathLength(x,x2,x3,Chrom,leng,Leng,R,T,Amount,maxamount,Number,zhonglei);  %计算路径长度
    % fprintf('%d   %1.10f\n',gen,min(ObjV))
    line([gen-1,gen],[preObjV,min(ObjV)]);%pause(0.0001)
    preObjV=min(ObjV);
    FitnV=fitness(ObjV);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fangan=Chrom(ObjV==preObjV,:);fangan=fangan(1,:);
    ppreObjV=[ppreObjV;preObjV];FANGAN=[FANGAN;fangan];
    %% 选择
    SelCh=Select(Chrom,FitnV,GGAP);
    %% 交叉操作
    SelCh=Recombin(SelCh,Pc);
    
    %% 变异
    SelCh=Mutate(SelCh,Pm);
    %% 逆转操作
    SelCh=Reverse(x,x2,x3,SelCh,leng,Leng,R,T,Amount,maxamount,Number,zhonglei);
    %% 重插入子代的新种群
    Chrom=Reins(Chrom,SelCh,ObjV);
    %% 更新迭代次数
    gen=gen+1 ;
end
%% 画出最优解的路径图
ObjV=PathLength(x,x2,x3,Chrom,leng,Leng,R,T,Amount,maxamount,Number,zhonglei);  %计算路径长度
[minObjV,minInd]=min(ObjV);
%DrawPath(Chrom(minInd(1),:),X)
%% 输出最优解的路径和总距离
disp('最优解:')
p=OutputPath(Chrom(minInd(1),:));
best=Chrom(minInd(1),:);
AA=cangweizhi2(leng,best);
disp(['总时间：',num2str(ObjV(minInd(1)))]);
disp('-------------------------------------------------------------')
