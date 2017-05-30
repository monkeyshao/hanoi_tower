function move_hanoi(n,k1,k3,v)
% make cartoon by input the sacale of hanoi tower, move start form k1 bar to k3 bar, volatility of v

clf;
if nargin < 2
    k1=1;
    k3=3;
end
if nargin < 4
    v=20;
end
[method,remain]=hanoi(n,k1,k3);
space=n+2-remain;
sr=start_ring(n,k1);
%calculate and prepair the method
t=length(method(:,1));
% v=80;
dx=1;
dt=dx/v;
p=size(method(:,1));
background(n);%draw the background
% u=25;
% color=u:u+n-1;color(i)
for i=1:length(sr)
    p(i)=patch(sr{i}(1,:),sr{i}(2,:),[0.3,0.7,1],'EraseMode','xor','EdgeColor','none');
end
%set handle of the rings,plot it
set(gcf,'Color',[1,1,1])
for j=1:t
    move_target=method(j,1);
    move_start=method(j,2);
    move_end=method(j,3);
    for t1=1:space(j,move_start)/dx
        sr{move_target}(2,:)=sr{move_target}(2,:)+dx;
        set(p(move_target),'YData',sr{move_target}(2,:));
        drawnow;
        pause(dt);
    end
    %move the pan up
    plu=abs((move_end-move_start))/(move_end-move_start);
    for t2=1:abs((move_end-move_start)*(2*n+3))/dx
        sr{move_target}(1,:)=sr{move_target}(1,:)+dx*plu;
        set(p(move_target),'xdata',sr{move_target}(1,:));
        drawnow;
        pause(dt);
    end
    %move the pan left or right
    for t3=1:(space(j,move_end)-1)/dx
        sr{move_target}(2,:)=sr{move_target}(2,:)-dx;
        set(p(move_target),'ydata',sr{move_target}(2,:));
        drawnow;
        pause(dt);
    end
    %move the pan dwon
end
