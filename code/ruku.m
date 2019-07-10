function [t,process,process2,Data,Time_data,load2] = ruku(Data,chrom1,Distance,DO2,Time_data,load2,date,time,l,r,z,G,amount)%,load2,Data,Time_data
t1=0;
t2=0;
t3=0;
local=0;
process=time;
process2=[date,0,time];
   kongcang=find(Data(1,:)==0);%%空仓所在位置  1是Leng长度
   col=find(Data(7,:)==z);%l、r是需要入库的单品规格,z是单品种类zhonglei  7是种类
   d=zeros(1,length(col));
    for i=1:length(col)
        d(i)=Distance(chrom1==local,chrom1==Data(6,col(i)));  %6是编号
    end
while amount>0
      if (~isempty(col))&&(sum(Data(4,col))<sum(Data(5,col)))  %4是数量，5是仓容最大值
     %%当仓容有剩余的时候
       coll=find(d==min(d));
       if Data(4,col(coll(1)))<Data(5,col(coll(1)))  
          if Data(5,col(coll(1)))-Data(4,col(coll(1)))<amount
              if load2(col(coll(1)))==0
                 Time_data((load2(col(coll(1)))+1)*1,col(coll(1)))=0;%等待时间
                 t3=t3+Time_data(1,col(coll(1)));%等待总时间
                 t1=t1+d(coll(1))/5000;%路程总时间
                 Time_data((load2(col(coll(1)))+1)*2,col(coll(1)))=time+t1+t2+t3;%到达时刻
                 t2=t2+(Data(5,col(coll(1)))-Data(4,col(coll(1))))*G/200;%卸货总时间
                 Time_data((load2(col(coll(1)))+1)*3,col(coll(1)))=time+t1+t2+t3;%离开该仓位的时刻
                 load2(col(coll(1)))=load2(col(coll(1)))+1;
              else 
                 t1=t1+d(coll(1))/5000;
                 if Time_data(load2(col(coll(1)))*3,col(coll(1)))>time+t1+t2+t3
                     Time_data(load2(col(coll(1)))*3+1,col(coll(1)))=Time_data(load2(col(coll(1)))*3,col(coll(1)))-(time+t1+t2+t3);
       
                     t3=t3+Time_data(load2(col(coll(1)))*3+1,col(coll(1)));%等待总时间
                     Time_data(load2(col(coll(1)))*3+2,col(coll(1)))=time+t1+t2+t3;
                     t2=t2+(Data(5,col(coll(1)))-Data(4,col(coll(1))))*G/200;
                     Time_data(load2(col(coll(1)))*3+3,col(coll(1)))=time+t1+t2+t3;%离开该仓位的时刻
                     load2(col(coll(1)))=load2(col(coll(1)))+1;
                 else
                     Time_data(load2(col(coll(1)))*3+1,col(coll(1)))=0;%t3是等待时间
                     t3=t3+Time_data(load2(col(coll(1)))*3+1,col(coll(1)));%等待总时间
                     Time_data(load2(col(coll(1)))*3+2,col(coll(1)))=time+t1+t2+t3;%到达时刻
                     t2=t2+(Data(5,col(coll(1)))-Data(4,col(coll(1))))*G/200;
                     Time_data(load2(col(coll(1)))*3+3,col(coll(1)))=time+t1+t2+t3;%离开该仓位的时刻
                     load2(col(coll(1)))=load2(col(coll(1)))+1;
                 end
              end 
              process=[process,col(coll(1)),Time_data(load2(col(coll(1)))*3-2,col(coll(1))),Time_data(load2(col(coll(1)))*3-1,col(coll(1))),Time_data(load2(col(coll(1)))*3,col(coll(1)))];
              process2=[process2,col(coll(1)),Time_data(load2(col(coll(1)))*3-1,col(coll(1))),z,Data(5,col(coll(1)))-Data(4,col(coll(1))),Time_data(load2(col(coll(1)))*3,col(coll(1)))];

              amount=amount-(Data(5,col(coll(1)))-Data(4,col(coll(1))));%更新数量
              Data(4,col(coll(1)))=Data(5,col(coll(1)));   %更新仓容
              Data(3,col(coll(1)))=date;%入库时间更新
              local=Data(6,col(coll(1)));%(1更新地点
              col(coll(1))=[];
              d=zeros(1,length(col));
              for i=1:length(col)
                  d(i)=Distance(chrom1==local,chrom1==Data(6,col(i)));  %6是编号
              end
          else 
               if load2(col(coll(1)))==0
                 Time_data(load2(col(coll(1)))*3+1,col(coll(1)))=0;%等待时间
                 t3=t3+Time_data(load2(col(coll(1)))*3+1,col(coll(1)));%等待总时间
                 t1=t1+d(coll(1))/5000;%路程总时间
                 Time_data(load2(col(coll(1)))*3+2,col(coll(1)))=time+t1+t2+t3;%到达时刻
                 t2=t2+amount*G/200;%卸货总时间
                 Time_data(load2(col(coll(1)))*3+3,col(coll(1)))=time+t1+t2+t3;%离开该仓位的时刻
                 load2(col(coll(1)))=load2(col(coll(1)))+1;
              else 
                 t1=t1+d(coll(1))/5000;
                 if Time_data(load2(col(coll(1)))*3,col(coll(1)))>time+t1+t2+t3
                     Time_data(load2(col(coll(1)))*3+1,col(coll(1)))=Time_data(load2(col(coll(1)))*3,col(coll(1)))-(time+t1+t2+t3);
       
                     t3=t3+Time_data(load2(col(coll(1)))*3+1,col(coll(1)));%等待总时间
                     Time_data(load2(col(coll(1)))*3+2,col(coll(1)))=time+t1+t2+t3;
                     t2=t2+amount*G/200;
                     Time_data(load2(col(coll(1)))*3+3,col(coll(1)))=time+t1+t2+t3;%离开该仓位的时刻
                     load2(col(coll(1)))=load2(col(coll(1)))+1;
                 else
                     Time_data(load2(col(coll(1)))*3+1,col(coll(1)))=0;%t3是等待时间
                     t3=t3+Time_data(load2(col(coll(1)))*3+1,col(coll(1)));%等待总时间
                     Time_data(load2(col(coll(1)))*3+2,col(coll(1)))=time+t1+t2+t3;%到达时刻
                     t2=t2+amount*G/200;
                     Time_data(load2(col(coll(1)))*3+3,col(coll(1)))=time+t1+t2+t3;%离开该仓位的时刻
                     load2(col(coll(1)))=load2(col(coll(1)))+1;
                 end
               end 
                process=[process,col(coll(1)),Time_data(load2(col(coll(1)))*3-2,col(coll(1))),Time_data(load2(col(coll(1)))*3-1,col(coll(1))),Time_data(load2(col(coll(1)))*3,col(coll(1)))];
                process2=[process2,col(coll(1)),Time_data(load2(col(coll(1)))*3-1,col(coll(1))),z,amount,Time_data(load2(col(coll(1)))*3,col(coll(1)))];

                 Data(4,col(coll(1)))=Data(4,col(coll(1)))+amount;%更新仓容
                 Data(3,col(coll(1)))=date;%入库时间更新
                 local=Data(6,col(coll(1)));%更新地点
                 amount=0;%更新数量
                 col(coll(1))=[];
                 d=zeros(1,length(col));
                 for i=1:length(col)
                     d(i)=Distance(chrom1==local,chrom1==Data(6,col(i)));  %6是编号
                 end
          end
        else 
              col(coll(1))=[];
              d(coll(1))=[];
                
        end
      %%当仓容不够的时候，重新找一个最近的空仓位放置
      elseif ~isempty(kongcang) 
          
              d=zeros(1,length(kongcang));
             for i=1:length(kongcang)
                 d(i)=Distance(chrom1==local,chrom1==Data(6,kongcang(i)));  %6是编号
             end  
             min_d=find(d==min(d));
             if ismember(z,Data(7,1:68))
                a=find(Data(7,1:68)==z);
                Data(5,kongcang(min_d(1)))=Data(5,a(1));
             else
                Data(5,kongcang(min_d(1)))=400/G;
             end
                Data(4,kongcang(min_d(1)))=min(amount,Data(5,kongcang(min_d(1))));   %更新仓容
                Data(1,kongcang(min_d(1)))=l;
                Data(2,kongcang(min_d(1)))=r;
                Data(3,kongcang(min_d(1)))=date;%入库时间更新
                Data(7,kongcang(min_d(1)))=z;
                if load2(kongcang(min_d(1)))==0
                   Time_data(load2(kongcang(min_d(1)))*3+1,kongcang(min_d(1)))=0;%等待时间
                    t3=t3+Time_data(load2(kongcang(min_d(1)))*3+1,kongcang(min_d(1)));%等待总时间
                    t1=t1+d(min_d(1))/5000;%路程总时间
                    Time_data(load2(kongcang(min_d(1)))*3+2,kongcang(min_d(1)))=time+t1+t2+t3;%到达时刻
                    t2=t2+min(amount,Data(5,kongcang(min_d(1))))*G/200;%卸货总时间
                    Time_data(load2(kongcang(min_d(1)))*3+3,kongcang(min_d(1)))=t1+t2+t3;%离开该仓位的时刻
                    load2(kongcang(min_d(1)))=load2(kongcang(min_d(1)))+1;
                else 
                    t1=t1+d(min_d(1))/5000;
                     if Time_data(load2(kongcang(min_d(1)))*3,kongcang(min_d(1)))>time+t1+t2+t3
                        Time_data(load2(kongcang(min_d(1)))*3+1,kongcang(min_d(1)))=Time_data(load2(kongcang(min_d(1)))*3,kongcang(min_d(1)))-(time+t1+t2+t3);
       
                         t3=t3+Time_data(load2(kongcang(min_d(1)))*3+1,kongcang(min_d(1)));%等待总时间
                         Time_data(load2(kongcang(min_d(1)))*3+2,kongcang(min_d(1)))=time+t1+t2+t3;
                         t2=t2+min(amount,Data(5,kongcang(min_d(1))))*G/200;
                         Time_data(load2(kongcang(min_d(1)))*3+3,kongcang(min_d(1)))=time+t1+t2+t3;%离开该仓位的时刻
                         load2(kongcang(min_d(1)))=load2(kongcang(min_d(1)))+1;
                     else
                        Time_data(load2(kongcang(min_d(1)))*3+1,kongcang(min_d(1)))=0;%t3是等待时间
                         t3=t3+Time_data(load2(kongcang(min_d(1)))*3+1,kongcang(min_d(1)));%等待总时间
                        Time_data(load2(kongcang(min_d(1)))*3+2,kongcang(min_d(1)))=time+t1+t2+t3;%到达时刻
                        t2=t2+min(amount,Data(5,kongcang(min_d(1))))*G/200;
                        Time_data(load2(kongcang(min_d(1)))*3+3,kongcang(min_d(1)))=time+t1+t2+t3;%离开该仓位的时刻
                        load2(kongcang(min_d(1)))=load2(kongcang(min_d(1)))+1;
                     end
                end 
                process=[process,kongcang(min_d(1)),Time_data(load2(kongcang(min_d(1)))*3-2,kongcang(min_d(1))),Time_data(load2(kongcang(min_d(1)))*3-1,kongcang(min_d(1))),Time_data(load2(kongcang(min_d(1)))*3,kongcang(min_d(1)))];
                process2=[process2,kongcang(min_d(1)),Time_data(load2(kongcang(min_d(1)))*3-1,kongcang(min_d(1))),z,min(amount,Data(5,kongcang(min_d(1)))),Time_data(load2(kongcang(min_d(1)))*3,kongcang(min_d(1)))];
                amount=amount-min(amount,Data(5,kongcang(min_d(1))));
                local=Data(6,kongcang(min_d(1)));
                kongcang=find(Data(1,:)==0);
      else break
      end
end
%time_end=time+t1+t2+t3+Distance(chrom1==local,length(Distance(1,:)))/5000;
time_end=time+t1+t2+t3+DO2(chrom1==local)/5000;
process2=[process2,time_end];
t=time_end-time;
%t=time+t1+t2+t3;
