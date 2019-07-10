function [Distance,DO2,chrom1]=juli2(A,leng)
%storage=[T;l;R;D;list;amount;];
a_1=A(10,:);a_2=A(9,:);b_1=A(8,:);b_2=A(7,:);c_1=A(6,:);c_2=A(5,:);d_1=A(4,:);d_2=A(3,:);e_1=A(2,:);e_2=A(1,:);
a_1(a_1==0)=[];a_2(a_2==0)=[];b_1(b_1==0)=[];b_2(b_2==0)=[];c_1(c_1==0)=[];c_2(c_2==0)=[];d_1(d_1==0)=[];d_2(d_2==0)=[];e_1(e_1==0)=[];e_2(e_2==0)=[];%去掉为0的数
chrom1=[0,a_1,a_2,b_1,b_2,c_1,c_2,d_1,d_2,e_1,e_2];
%O1到A1堆场的距离
csuma1=cumsum(leng(a_1)); %将距离做累加
%border1=142-17.5-csuma1(length(csuma1))-(length(csuma1)-1)*0.8;
 i=1:length(a_1);
 da1=57.5+17.5+csuma1(i)+(i-1)*0.8;
 %A1堆场到O2的距离
 a1_o2=199.5+46+25.5+142+19+15+46+46+20+36-da1;


%O1到A2堆场的距离
csuma2=cumsum(leng(a_2)); %将距离做累加
%border2=142-17.5-csuma2(length(csuma2))-(length(csuma2)-1)*0.8;
 i=1:length(a_2);
 da2=57.5+17.5+csuma2(i)+(i-1)*0.8;
 %A2堆场到O2的距离
 a2_o2=199.5+46+25.5+142+19+15+46+46+20+36-da2;



%O1到B1堆场的距离
%reversed=flip(b1);%倒过来
csumb1=cumsum(leng(b_1));
%border3=142-13.5-csumb1(length(csumb1))-(length(csumb1)-1)*0.8;%最边上的仓位到边缘的距离
 i=1:length(b_1);
db1=199.5+13.5+46+csumb1(i)+(i-1)*0.8;
%B1堆场到O2的距离
 b1_o2=199.5+46+25.5+142+19+15+46+46+20+36-db1;


%O1到B2堆场的距离
%reversed=flip(b1);%倒过来
csumb2=cumsum(leng(b_2));
border4=142-13.5-csumb2(length(csumb2))-(length(csumb2)-1)*0.8;%最边上的仓位到边缘的距离
 i=1:length(b_2);
db2=199.5+13.5+46+csumb2(i)+(i-1)*0.8;
%B2堆场到O2的距离
 b2_o2=199.5+46+25.5+142+19+15+46+46+20+36-db2;


%O1到C1堆场的距离
%reversed=flip(c1);%倒过来
csumc1=cumsum(leng(c_1));
%border5=156-17.5-csumc1(length(csumc1))-(length(csumc1)-1)*0.8;%最边上的仓位到边缘的距离
 i=1:length(c_1);
dc1=57.5+46+25.5+19+15+17.5+csumc1(i)+(i-1)*0.8;
%C1堆场到O2的距离
 c1_o2=57.5+46+25.5+19+15+156+46+46+20+156+36-dc1;


%O1到C2堆场的距离
%reversed=flip(c1);%倒过来
csumc2=cumsum(leng(c_2));
%border6=156-17.5-csumc2(length(csumc2))-(length(csumc2)-1)*0.8;%最边上的仓位到边缘的距离
 i=1:length(c_2);
 dc2=57.5+46+25.5+19+15+17.5+csumc2(i)+(i-1)*0.8;
 %C2堆场到O2的距离
 c2_o2=57.5+46+25.5+19+15+156+46+46+20+156+36-dc2;



%O1到D1堆场的距离
%reversed=flip(c1);%倒过来
csumd1=cumsum(leng(d_1));
%border7=156-13.5-csumd1(length(csumd1))-(length(csumd1)-1)*0.8;%最边上的仓位到边缘的距离
 i=1:length(d_1);
dd1=57.5+46+25.5+19+61+156+15+61+46+13.5+csumd1(i)+(i-1)*0.8;
%D1堆场到O2的距离
 d1_o2=57.5+46+25.5+19+61+156+61+15+46+156+46+20+36-dd1;



%O1到D2堆场的距离
%reversed=flip(c1);%倒过来
csumd2=cumsum(leng(d_2));
%border8=156-13.5-csumd2(length(csumd2))-(length(csumd2)-1)*0.8;%最边上的仓位到边缘的距离
 i=1:length(d_2);
dd2=57.5+46+25.5+19+61+156+15+61+46+13.5+csumd2(i)+(i-1)*0.8;
%D2堆场到O2的距离
 d2_o2=57.5+46+25.5+19+61+156+61+15+46+156+46+20+36-dd2;



%O1到E1堆场的距离
%reversed=flip(c1);%倒过来
csume1=cumsum(leng(e_1));
%border9=156-17.5-csume1(length(csume1))-(length(csume1)-1)*0.8;%最边上的仓位到边缘的距离
 i=1:length(e_1);
de1=57.5+46+25.5+19+15+46+46+17.5+csume1(i)+(i-1)*0.8;
%E1堆场到O2的距离
 e1_o2=57.5+46+25.5+19+15+46+46+156+20+156+36-de1;


%O1到E2堆场的距离
%reversed=flip(c1);%倒过来
csume2=cumsum(leng(e_2));
%border10=156-17.5-csume2(length(csume2))-(length(csume2)-1)*0.8;%最边上的仓位到边缘的距离
i=1:length(e_2);
de2=57.5+46+25.5+19+15+46+46+17.5+csume2(i)+(i-1)*0.8;
%E2堆场到O2的距离
 e2_o2=57.5+46+25.5+19+15+46+46+156+20+156+36-de2;
%O1到O2的距离
O1O2=57.5+46+25.5+19+15+46+46+20+36;
DO2=[O1O2,a1_o2,a2_o2,b1_o2,b2_o2,c1_o2,c2_o2,d1_o2,d2_o2,e1_o2,e2_o2];


DO1=[0,da1,da2,db1,db2,dc1,dc2,dd1,dd2,de1,de2];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%第一个点与其他点的距离矩阵


        %%%%%%%%%%%%%%%%%%%                 A堆场的距离矩阵
         i=1:length(da1);
            da11=da1(i)-da1(1);%a1堆场的第一个仓位a1堆场其他仓位之间的距离
       
         i=1:length(da2);
            da21=da2(i)-da1(1);%a1堆场的第一个仓位与a2堆场其他仓位之间的距离
      
         i=1:length(db1);
            db11=db1(i)-da1(1);
        
         i=1:length(db2);
         db21=db2(i)-da1(1);
        
         i=1:length(dc1);
         dc11=199.5+46+25.5+142+19+15+17.5+csumc1(i)+(i-1)*0.8-da1(1);
        
         i=1:length(dc2);
            dc21=199.5+46+25.5+142+19+15+17.5+csumc2(i)+(i-1)*0.8-da1(1);
        
         i=1:length(dd1);
            dd11=199.5+46+25.5+142+19+15+156+61+61+46+13.5+csumd1(i)+(i-1)*0.8-da1(1);
        
         i=1:length(dd2);
            dd21=199.5+46+25.5+142+19+15+156+61+61+46+13.5+csumd2(i)+(i-1)*0.8-da1(1);
        
         i=1:length(de1);
            de11=199.5+46+25.5+142+19+15+46+46+17.5+csume1(i)+(i-1)*0.8-da1(1);
        
         i=1:length(de2);
            de21=199.5+46+25.5+142+19+15+46+46+17.5+csume2(i)+(i-1)*0.8-da1(1);
      
            
        Da1(1,:)=[-DO1(2),da11,da21,db11,db21,dc11,dc21,dd11,dd21,de11,de21];%Da1(1,:)代表a1堆场的第一个仓位与其他仓位之间的距离
        for i=2:length(a_1)
        Da1(i,:)=Da1(1,:)-csuma1(i)-(i-1)*0.8+csuma1(1);%Da1代表a1堆场的各个仓位与其他仓位之间的距离
        end
        
        Da2=zeros(length(a_2),length(Da1(1,:)));
        for i=1:length(a_2)
            Da2(i,:)=Da1(1,:)-csuma2(i)-(i-1)*0.8+csuma1(1);
        end
        %%%%%%%%%%%%%%                   B堆场的距离矩阵
        Db1=zeros(length(b_1),length(Da1(1,:)));
        for i=1:length(b_1);
        Db1(i,:)=Da1(1,:)-13.5-46-111-13.5-csumb1(i)-(i-1)*0.8+csuma1(1);
        end
        Db2=zeros(length(b_2),length(Da1(1,:)));
        for i=1:length(b_2);
        Db2(i,:)=Da1(1,:)-13.5-46-111-13.5-csumb2(i)-(i-1)*0.8+csuma1(1);
        end
        
        %%%%%%%%%%%%%%%%           C堆场的距离矩阵
        i=1:length(c_1);
        c1_1_c1=dc1(i)-dc1(1);%c1堆场的第一个仓位到c1堆场其他仓位的距离
        i=1:length(c_2);
        c1_1_c2=dc2(i)-dc1(1);%c1堆场的第一个仓位到c2堆场其他仓位的距离
        i=1:length(d_1);
        c1_1_d1=156-17.5-csumc1(1)+46+13.5+csumd1(i)+(i-1)*0.8;
        i=1:length(d_2);
        c1_1_d2=156-17.5-csumc1(1)+46+13.5+csumd2(i)+(i-1)*0.8;
        i=1:length(e_1);
        c1_1_e1=156-17.5-csumc1(1)+46+156+46+17.5+csume1(i)+(i-1)*0.8;
        i=1:length(e_2);
        c1_1_e2=156-17.5-csumc1(1)+46+156+46+17.5+csume2(i)+(i-1)*0.8;
  
        Dc1(1,:)=[-DO1(length(a_1)+length(a_2)+length(b_1)+length(b_2)+2),ones(1,length(a_1)+length(a_2)+length(b_1)+length(b_2))*(-500),c1_1_c1,c1_1_c2,c1_1_d1,c1_1_d2,c1_1_e1,c1_1_e2];%c1堆场的第一个仓位到各个点的距离
        
        for i=2:length(c_1)
            Dc1(i,:)=Dc1(1,:)-csumc1(i)-(i-1)*0.8+csumc1(1);
        end
        
        Dc2=zeros(length(c_2),length(Da1(1,:)));
        for i=1:length(c_2)
            Dc2(i,:)=Dc1(1,:)-csumc2(i)-(i-1)*0.8+csumc1(1);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         D堆场的距离矩阵
        i=1:length(d_1);
        d1_1_d1=dd1(i)-dd1(1);%d1堆场的第一个仓位到d1堆场其他仓位的距离
        i=1:length(d_2);
        d1_1_d2=dd2(i)-dd1(1);%d1堆场的第一个仓位到d2堆场其他仓位的距离 
        i=1:length(e_1);
        d1_1_e1=156-13.5-csumd1(1)+46+17.5+csume1(i)+(i-1)*0.8;
        i=1:length(e_2);
        d1_1_e2=156-13.5-csumd1(1)+46+17.5+csume2(i)+(i-1)*0.8;
        
        Dd1(1,:)=[-DO1(length(a_1)+length(a_2)+length(b_1)+length(b_2)+length(c_1)+length(c_2)+2),ones(1,length(a_1)+length(a_2)+length(b_1)+length(b_2)+length(c_1)+length(c_2))*(-500),d1_1_d1,d1_1_d2,d1_1_e1,d1_1_e2];%d1堆场的第一个仓位到各个点的距离
        for i=2:length(d_1)
            Dd1(i,:)=Dd1(1,:)-csumd1(i)-(i-1)*0.8+csumd1(1);
        end
         Dd2=zeros(length(d_2),length(Da1(1,:)));
        for i=1:length(d_2)
            Dd2(i,:)=Dd1(1,:)-csumd2(i)-(i-1)*0.8+csumd1(1);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       E堆场的距离矩阵
        i=1:length(e_1);
        e1_1_e1=de1(i)-de1(1);
        i=1:length(e_2);
        e1_1_e2=de2(i)-de1(1);
        De1(1,:)=[-DO1(length(a_1)+length(a_2)+length(b_1)+length(b_2)+length(c_1)+length(c_2)+length(d_1)+length(d_2)+2),ones(1,length(a_1)+length(a_2)+length(b_1)+length(b_2)+length(c_1)+length(c_2)+length(d_1)+length(d_2))*(-500),e1_1_e1,e1_1_e2];
        for i=2:length(e_1)
            De1(i,:)=De1(1,:)-csume1(i)-(i-1)*0.8+csume1(1);
        end
         De2=zeros(length(e_2),length(Da1(1,:)));
        for i=1:length(e_2) 
            De2(i,:)=De1(1,:)-csume2(i)-(i-1)*0.8+csume1(1);
        end
        
        %%%%%%%%%%%%%总的距离矩阵为
        
        %Distance=[DO1;Da1;Da2;Db1;Db2;Dc1;Dc2;Dd1;Dd2;De1;De2;-DO2];
        Distance=[DO1;Da1;Da2;Db1;Db2;Dc1;Dc2;Dd1;Dd2;De1;De2;];
        %DO2new=[DO2,0];
        %Distance=[Distance,DO2new'];
        for i=1:length(Distance(1,:))
            Distance(i,i)=0;
        end
        Distance(Distance<0)=1000;
end
