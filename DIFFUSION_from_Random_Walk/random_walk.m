% A code for simulating random walk

clear,clc,close all 
% clear - delete all variables from matlab memory
% clc - clear screen
% close all - close all matlab figure windows

space_2d=zeros(121,121); 
x=61;
y=61;
space_2d(x,y)=1;
% We are going to play random walk here


for i=1:500
	direction=randi(4);
	% randi(4) is a uniform distributed integer which spits out integers 1 to 4
	% Let 1 imply right,2 - up, 3 - left, 4 - down
	if direction==1
	x=x+1;
	space_2d(x,y)=1;
	elseif direction==2
	y=y+1;
    space_2d(x,y)=1;
	elseif direction==3
	x=x-1;
	space_2d(x,y)=1;
	elseif direction==4
	y=y-1;
    space_2d(x,y)=1;
	end

end

imagesc(space_2d)
