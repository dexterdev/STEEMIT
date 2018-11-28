% This reduces the dimension of ubiquitin CA dcd files to 3 D
clear,close,clc
xyz=readdcd('/home/devanandt/Documents/SIMULATION_TECHNIQUES_IN_BIOLOGY/NETWORK-ANALYSIS/ubq_L67S_L69S_CAfitted.dcd',1:76);
[U,S,V]=svd(xyz);
xyz_r= U(:,[1:3])*S([1:3],[1:3])*V(:,[1:3])';
p=xyz_r;
x1=p(:,1:3:end);
y1=p(:,2:3:end);
z1=p(:,3:3:end);
rc = writedcd('3D_ubq.dcd',x1',y1',z1')
