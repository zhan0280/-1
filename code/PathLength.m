%% 计算各个体的路径长度
% 输入：
% D     两两城市之间的距离
% Chrom 个体的轨迹
function t_add=PathLength(x,x2,x3,Chrom,leng,Leng,R,T,Amount,maxamount,Number,zhonglei)
NIND=size(Chrom,1);
t_add=zeros(NIND,1);
aa=exprnd(7.6,1,120);
%bb=aa(aa<=12);
cc=sort(aa);
cc=cc(1:94);
cc(find(cc>12))=12;
for y=1:NIND
    Data=[Leng;R;T;Amount;maxamount;Number;zhonglei];%Leng是仓位单品长度，R是仓位单品直径，T是最早入库时间，Amount是目前仓所摆放的件数，maxamount是能摆放的最大件数,Number是仓位编号,local是目前所在位置
    process1=zeros(10,100);
    process3=zeros(10,100);
    process5=zeros(85,100);
    process6=zeros(85,100);
    tt1=zeros(1,9);
    tt2=zeros(1,100);
    Time_data=zeros(20*3,95);
    load2=zeros(1,100);
    %liudongcang=Data(4,69:98);

    chrom0=Chrom(y,:);
    A=cangweizhi2(leng,chrom0);
    [Distance,DO2,chrom1]=juli2(A,leng);
        date=ones(1,9)*1;
        time=cc(1:9);
        l=[9,9,9,9,9,9,9,9,9];
        r=[12,12,12,12,12,12,22,16,22];
        z=[9,9,9,9,9,9,19,3,19];
        G=[1.758,1.758,1.758,1.758,1.758,1.758,2.682,1.706,2.682];
        amount=[34,32,32,36,36,34,18,5,18];
        for p=1:9
            [t,process,process2,Data,Time_data,load2]=ruku(Data,chrom1,Distance,DO2,Time_data,load2,date(p),time(p),l(p),r(p),z(p),G(p),amount(p));%,Data,Time_data,load2
            i=1:length(process);
            process1(p,i)=process(i);
            j=1:length(process2);
            process3(p,j)=process2(j);
            tt1(p)=t;
        end
      time2=cc(10:94);
      for q=1:length(x(:,1))
    %chukudata1=chukudata(n,:);
    %chukudata1(chukudata1(1,:)==0)=[];
    %l=chukudata1(1:(length(chukudata1)-1)/5);
    %r=chukudata1((length(chukudata1)-1)/5+1:(length(chukudata1)-1)/5+5);
    %z=chukudata1((length(chukudata1)-1)/5+6:(length(chukudata1)-1)/5+10);
    %G=chukudata1((length(chukudata1)-1)/5+11:(length(chukudata1)-1)/5+15);
    %amount=chukudata1((length(chukudata1)-1)/5+16:(length(chukudata1)-1)/5+20);
    %time=chukudata1(length(chukudata1));
    z=x(q,:);
    z(z==0)=[];
    amount=x2(q,:);
    amount(amount==0)=[];
    time=time2(q);
    for h=1:length(z)
        G(h)=x3(x3(:,1)==z(h),4);
    end
    date=1;
    [t,process,process4,Data,Time_data,load2]=chuku(Data,chrom1,Distance,DO2,Time_data,load2,date,time,z,G,amount);%,Data,Time_data,load2
    i=1:length(process);
    process5(q,i)=process(i);
    j=1:length(process4);
    process6(q,j)=process4(j);
    tt2(q)=t;
    liudongcang=Data(4,69:95);
    a=find(liudongcang==0);
    Data(1,a+68)=0;
    Data(2,a+68)=0;
    Data(7,a+68)=0;  
      end    
t_add(y,1)=sum(tt1)+sum(tt2);
        
end