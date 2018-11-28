clear, clc
xyz=readdcd('/home/devanandt/Documents/SIMULATION_TECHNIQUES_IN_BIOLOGY/NETWORK-ANALYSIS/ubq_L67S_L69S_CAfitted.dcd',1:76);
%readdcd from here: https://www.ks.uiuc.edu/Development/MDTools/matdcd/
[pc, score, latent, tsquare] = princomp(xyz);
score=score(:,1:3);%first 3 projected eigen vectors corresponding to the 3 highest eigen values
save PC_all_combined_ubq-fitted.dat score -ascii
pc1_percentage=latent(1)/sum(latent)%highest PC%
pc2_percentage=latent(2)/sum(latent)%second highest PC%

%Dimensionally reduced RMSD
%for i=1:1250
%rmsd(i)=norm(score(i,1:2)-score(1,1:2))/sqrt(76);
%end
%plot(rmsd)
