% A code for simulate diffusion from 1000 random walks

clear,clc,close all 
% clear - delete all variables from matlab memory
% clc - clear screen
% close all - close all matlab figure windows

space_2d=zeros(201,201,100); 
x=101;
y=101;
space_2d(x,y,1)=1;
% We are going to play random walk here

direction=randi(4);
% randi(4) is a uniform distributed integer which spits out integers 1 to 4
% Let 1 imply right,2 - up, 3 - left, 4 - down

for repeat=1:1000
x=101;
y=101;
 for i=1:500
	direction=randi(4);
	% randi(4) is a uniform distributed integer which spits out integers 1 to 4
	% Let 1 imply right,2 - up, 3 - left, 4 - down
	if direction==1
	x=x+1;
	space_2d(x,y,repeat)=1;
	elseif direction==2
	y=y+1;
    space_2d(x,y,repeat)=1;
	elseif direction==3
	x=x-1;
	space_2d(x,y,repeat)=1;
	elseif direction==4
	y=y-1;
    space_2d(x,y,repeat)=1;
	end

 end
end
imagesc(mean(space_2d,3))