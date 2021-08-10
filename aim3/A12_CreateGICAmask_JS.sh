#!/bin/bash

#Author:	Sarah Ordaz and Jackie Schwartz (revisted by Jackie 2021 Feb 15)
#Date: 	 	2018 Sep 18
#DIR: 		/share/iang/proc/ELSanalysis/Projects/SIQ
#FILE:		A12_CreateGICAmask.bash
#Notes:  	!! Careful !! Dual regression files are 0-24, whereas melodic report is 1-25

# 1[0] means 1 on 1-25 scale, 0 on 0-24 scale (briks):
# Only +.  Not clear how to interpret anticorrelations within GICA-identified network 
#An example
#3dcalc -a 'func+orig[0]' -expr 'ispositive(a-3.14159)' -prefix mask           
#An example from point and click menu 
#3dclust -1Dformat -nosum -1dindex 3 -1tindex 1 -2thresh -4.14 4.14 -dxyz=1 -savemask Clust_mask 1.44 30 /Volumes/group/iang/biac3/gotlib7/data/OrdazELSanalysis/Analyses201511/DualReg/dr_stage2_ic0002.nii.gz


# Feb 15, 2021
# threshold at 3.348676 (for n=171, df=170) for pvoxelwise = .001  (determined with qt(.001/2, 170)) in R 
# 3dClustSim -acf a b c -nxyz 99 117 95 -dxyz 2 2 2 - BALL # 99 117 95 are number of voxels in that dimension (run 3dinfo on the melodic file created in A10 (melodic ICA))

# Mar 13, 2021
# threshold at 3.349737 (for n=168, df=167) for pvoxelwise = .001  (determined with qt(.001/2, 167)) in R 

# MAY 10, 2021
# threshold at -3.37638 (for n=117, df=116) for pvoxelwise = .001 (determined with qt(.001/2, 116)) in R 

rootdir="/Volumes/iang/users/schwartzJ/ICA/GroupICA_MW_32R.gica"

cd ${rootdir}


## MASKS - 36R actigraphy (with GSR)
## [1] anterior DMN
## [2] Left ECN
## [7] Right ECN
## [11] posterior DMN
## [18] Noise (there wasn't a great noise network here, but chose [18] brainstem/cerebellum)
# just in case reviewers want to see other networks ([4] salience, [14] thalamic/striatal )

## MASKS - 36R MW (with GSR)
## [0] anterior DMN
## [2] Right ECN
## [5] Left ECN
## [11] posterior DMN
## [19] Noise (there wasn't a great noise network here, but chose [19] brainstem/cerebellum)
# just in case reviewers want to see other networks ([6] salience, [14] thalamic/striatal )


3dcalc \
	-a 'melodic_IC.nii.gz[0]' \
	-expr 'ispositive(a-3.38)' \
	-prefix ${rootdir}/mask_aDMN.nii.gz

3dcalc \
	-a 'melodic_IC.nii.gz[1]' \
	-expr 'ispositive(a-3.38)' \
	-prefix ${rootdir}/mask_rECN.nii.gz

3dcalc \
	-a 'melodic_IC.nii.gz[4]' \
	-expr 'ispositive(a-3.38)' \
	-prefix ${rootdir}/mask_lECN.nii.gz	

3dcalc \
	-a 'melodic_IC.nii.gz[13]' \
	-expr 'ispositive(a-3.38)' \
	-prefix ${rootdir}/mask_pDMN.nii.gz

3dcalc \
	-a 'melodic_IC.nii.gz[19]' \
	-expr 'ispositive(a-3.38)' \
	-prefix ${rootdir}/mask_Noise_brainstem.nii.gz	

3dcalc \
	-a 'melodic_IC.nii.gz[11]' \
	-expr 'ispositive(a-3.38)' \
	-prefix ${rootdir}/mask_salience.nii.gz		

3dcalc \
	-a 'melodic_IC.nii.gz[15]' \
	-expr 'ispositive(a-3.38)' \
	-prefix ${rootdir}/mask_thalamicstriatal.nii.gz	

3dcalc \
	-a 'melodic_IC.nii.gz[14]' \
	-expr 'ispositive(a-3.38)' \
	-prefix ${rootdir}/mask_Noise_sss.nii.gz	