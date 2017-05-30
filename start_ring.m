function c=start_ring(n,k1)
c=cell(1,n);
c{n}=[1+(2*n+3)*(k1-1),2*n+1+(2*n+3)*(k1-1),2*n+1+(2*n+3)*(k1-1),1+(2*n+3)*(k1-1);0,0,1,1];
for i=n-1:-1:1
    c{i}=c{i+1};
    c{i}(1,:)=c{i}(1,:)+[1,-1,-1,1];
    c{i}(2,:)=c{i}(2,:)+1;
end
%initial a cell to store the axis of the pan