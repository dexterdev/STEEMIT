
clear
A=imread('Cheshire_cat.jpg');
%A=imread('square_cat.jpg');
%A=imread('/home/devanandt/Documents/STEEMIT/IMG-20170503-WA0002.jpg');


s=size(A);
s=min(s(1),s(2));
A = imresize(A,[s s]);

iter=96;
N=s;
Aold=A;
Anew=A;
h=figure
for i=1:iter
	for x = 1 : s
		for y = 1 : s
            xmap = mod(x+y, N) + 1;
			ymap = mod(x+2*y, N) + 1;
			Anew(x, y, :) = Aold(xmap, ymap, :);
		end
	end
imshow(Anew)
title(sprintf('Iteration %d', i))
pause(0.1)

    drawnow 
      % Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if i == 1 
          imwrite(imind,cm,'cat.gif','gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,'cat.gif','gif','WriteMode','append'); 
      end 


Aold=Anew;
end
