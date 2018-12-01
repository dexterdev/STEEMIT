This folder contains the data necessary for my steemit article **Studying global motions of proteins from Molecular Dynamics trajectories**. Link : https://steemit.com/steemstem/@dexterdev/studying-global-motions-of-proteins-from-molecular-dynamics-trajectories

And this article: https://steemit.com/steemstem/@dexterdev/addendum-to-my-previous-post-pca-caveat-tracking-ubiquitin-in-the-principal-component-space


File details
============
- RMSD.pdf (RMSD plot)
- dim_redn_trajectory.m (Matlab file to dimensionally reduce DCD trajectory)
- fit.tcl (tcl script to create fitted trajectory)
- pca.pdf (PCA plot)
- pca_md.m (Matlab script to do PCA on MD trajectory)
- rmsf.tcl (Tcl script to evaluate RMSF of CA atoms)
- PC_all_combined_ubq-fitted.dat (PC1 PC2 PC3 vectors in 1st 2nd 3rd columns and row numbers in 4th column)
- video_PC_tracker_new.m (code in MATLAB to temporally and spatially track the simulation structures in the principal component space)

Trjectory files:

- 3D_ubq.dcd (dimensionally reduced trajectory)
- ubq_L67S_L69S_CAfitted.dcd (CA atoms' trajectory of Ubiquitin simulation. 25 ns data. Fitted w.r.t. initial structure.)
- ubq_L67S_L69S_CAfitted.psf
