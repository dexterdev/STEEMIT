clear,clc,close

% initial conditions
m = zeros(32,32,2500);

%horizontal lines
for i=1:5000
    r= randi([1 32],[1 1]);
    c= sort(randi([1 32],[1 2]));
    m(r,c(1):c(2),i) = 1;
    imwrite(m(:,:,i),strcat('/home/devanandt/Documents/ML_HOBBY/hor_ver/data/','h.',num2str(i-1),'.jpg'),'jpeg');
end
m = zeros(32,32,2500);
%vertical
for i=1:5000
    c= randi([1 32],[1 1]);
    r= sort(randi([1 32],[1 2]));
    m(r(1):r(2),c,i) = 1;
    imwrite(m(:,:,i),strcat('/home/devanandt/Documents/ML_HOBBY/hor_ver/data/','v.',num2str(i-1),'.jpg'),'jpeg');
end
