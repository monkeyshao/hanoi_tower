function [method,remain]=hanoi(n,k1,k3)
if n==1
    method=[n,k1,k3];
    %set the initial 
else
    a=hanoi(n-1,k1,6-k1-k3);
    b=[n,k1,k3];
    c=hanoi(n-1,6-k1-k3,k3);
    method=[a;b;c];
end
%repeate to calculate 
remain=zeros(1+length(method(:,1)),3);
remain(1,k1)=n;
for i=2:length(method(:,1))+1
    remain(i,:)=remain(i-1,:);
    remain(i,method(i-1,2))=remain(i,method(i-1,2))-1;
    remain(i,method(i-1,3))=remain(i,method(i-1,3))+1;
end
%set down the method
