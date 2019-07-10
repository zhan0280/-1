function Sel Ch=Mutate(Sel Ch,Pm)
[NSel,L]=size(Sel Ch);
for i=1:NSel
if Pm>=rand
R=randperm(L);
Sel Ch(i,R(1:2))=Sel Ch(i,R(2:-1:1));
end
end
