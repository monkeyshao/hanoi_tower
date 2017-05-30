function background(n)
x1=[0,2*n+2,2*n+3,4*n+5,4*n+6,6*n+8];y1=zeros(size(x1));%
x2=[n+1,n+1,3*n+4,3*n+4,5*n+7,5*n+7];y2=[0,n+1,0,n+1,0,n+1];
x=[x1,x2];y=[y1,y2];
%set background point axis
%axis equal;
axis([0,6*n+8,-1,n+3]);
for i=1:2:length(x)-1
    line(x(i:i+1),y(i:i+1),'Color',[0,0,0]);
    hold on
end
%plot the backgroud line
axis off;
