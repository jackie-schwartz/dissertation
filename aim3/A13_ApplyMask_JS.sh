#!/bin/bash

#Author:	Sarah Ordaz; edited by Jackie Kirshenbaum


#Notes:  	Apply mask to dr_stage2_subjectXX.nii.gz 
#				Why this file?  "These are the GLM "parameter estimate" (PE) images, i.e., are not normalised by the residual within-subject noise. By default we recommend that it is these that are fed into stage 3 (the final cross-subject modelling)."
#				If this doesn't work...Try dr_stage2_subject[#SUB]_Z.nii.gz - "the Z-stat version of the above, which could be fed into the cross-subject modelling, but in general does not seem to work as well as using the PEs"
#						The Z file has more non-zero voxels and may provide more variability. 
#						Indeed, the Z file is better!  The non-Z networks are all correlated with each other (except control networks)
#				See "http://fsl.fmrib.ox.ac.uk/fsl/fslwiki/DualRegression/UserGuide"
#

#TODO:		Adjust $num is loop below (see $num -le 30)

#Ran: 		2015 Dec 10
#			2016 Apr 04
#			2017 Mar 24
# 			2018 April 02
#			2018 May 23
# 			2021 Mar 13
# 			2021 May 12


# May 2021 analysis:
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


rootdir="/Volumes/iang/users/schwartzJ/ICA"
maskdir="GroupICA_MW_32R.gica"
datadir="DualReg_MW32R"

voxels="" 					#""				#" -quiet"
voxelsCode="_wVoxels" 		#"_wVoxels" 	#""

date="20210512"
ROI="thalamicstriatal"		
brik="[15]"		


echo "*******************************************"
echo "***** Make sure to remove old file**********"
echo "*******************************************"
#Date
echo "maskdir = " ${maskdir}
echo "datadir = " ${datadir}

echo "*******************************************" >> ${rootdir}/${datadir}/${date}_${ROI}${voxelsCode}_Z.txt

#Had to do a three-section workaround because of the way the file was named "subject00001" with a fixed number of 0s in front of $num
#Also, doesn't work if you do ${num} instead of $num.  Perhaps because it doesn't evaluate it as a number?
num=0
while [ $num -le 9 ]; do
	echo "First, I'm at num=${num}"
	3dmaskave${voxels} -mask ${rootdir}/${maskdir}/mask_${ROI}.nii.gz ${rootdir}/${datadir}/dr_stage2_subject0000${num}_Z.nii.gz${brik} >> ${rootdir}/${datadir}/${date}_${ROI}${voxelsCode}_Z.txt
	let num=num+1
done

num=10
while [ $num -ge 10 ] && [ $num -le 99 ]; do
	echo "Second, I'm at num=${num}"
	3dmaskave${voxels} -mask ${rootdir}/${maskdir}/mask_${ROI}.nii.gz ${rootdir}/${datadir}/dr_stage2_subject000${num}_Z.nii.gz${brik} >> ${rootdir}/${datadir}/${date}_${ROI}${voxelsCode}_Z.txt
	let num=num+1
done

num=100
while [ $num -ge 100 ] && [ $num -le 118 ]; do
	echo "Third, I'm at num=${num}"
	3dmaskave${voxels} -mask ${rootdir}/${maskdir}/mask_${ROI}.nii.gz ${rootdir}/${datadir}/dr_stage2_subject00${num}_Z.nii.gz${brik} >> ${rootdir}/${datadir}/${date}_${ROI}${voxelsCode}_Z.txt
	let num=num+1
done
