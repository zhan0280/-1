function A=cangweizhi2(leng,chrom0)
m=1;
    A=zeros(10,12);
    B=[125,125,125,125,125,125,111,111,98,98];
    for j=1:length(leng);
        if (leng(chrom0(j))<=B(m))
            A(m,j)=chrom0(j);
            B(m)=B(m)-leng(chrom0(j))-0.8;
         
            q=j;
        else
            m=m+1;
            break
        end
    end
    for j=j:length(leng)
        if (leng(chrom0(j))<=B(m))
            A(m,j-q)=chrom0(j);
            B(m)=B(m)-leng(chrom0(j))-0.8;
         
        else
            m=m+1;
            q=j-1;
            break
        end
    end
    for j=j:length(leng)
        if (j>length(leng))
            break
        elseif (leng(chrom0(j))<=B(m))
            A(m,j-q)=chrom0(j);
            B(m)=B(m)-leng(chrom0(j))-0.8;
       
        else
            m=m+1;
            q=j-1;
            break
        end
    end
    for j=j:length(leng)
        if (j>length(leng))
            break
        elseif (leng(chrom0(j))<=B(m))
                A(m,j-q)=chrom0(j);
                B(m)=B(m)-leng(chrom0(j))-0.8;
        
        else
            m=m+1;
            q=j-1;
            break
        end
    end
    for j=j:length(leng)
        if (j>length(leng))
            break
        elseif (leng(chrom0(j))<=B(m))
                A(m,j-q)=chrom0(j);
                B(m)=B(m)-leng(chrom0(j))-0.8;
        
        else
            m=m+1;
            q=j-1;
            break
        end
    end
    for j=j:length(leng)
        if (j>length(leng))
            break
        elseif (leng(chrom0(j))<=B(m))
                A(m,j-q)=chrom0(j);
                B(m)=B(m)-leng(chrom0(j))-0.8;
     
        else
            m=m+1;
            q=j-1;
            break
        end
    end
    for j=j:length(leng)
        if (j>length(leng))
            break
        elseif (leng(chrom0(j))<=B(m))
                A(m,j-q)=chrom0(j);
                B(m)=B(m)-leng(chrom0(j))-0.8;
        
        else
            m=m+1;
            q=j-1;
            break
        end
    end
    for j=j:length(leng)
        if (j>length(leng))
            break
        elseif (leng(chrom0(j))<=B(m))
                A(m,j-q)=chrom0(j);
                B(m)=B(m)-leng(chrom0(j))-0.8;
        
        else
            m=m+1;
            q=j-1;
            break
        end
    end
    for j=j:length(leng)
        if (j>length(leng))
            break
        elseif (leng(chrom0(j))<=B(m))
                A(m,j-q)=chrom0(j);
                B(m)=B(m)-leng(chrom0(j))-0.8;
       
        else
            m=m+1;
            q=j-1;
            break
        end
    end
    for j=j:length(leng)
        if (leng(chrom0(j))<=B(m))
            A(m,j-q)=chrom0(j);
            B(m)=B(m)-leng(chrom0(j))-0.8;
   
        else
            m=m+1;
            q=j-1;
            break
        end
    end
end