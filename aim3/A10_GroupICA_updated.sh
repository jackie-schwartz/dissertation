#!/bin/bash

rootdir="/oak/stanford/groups/iang/users/schwartzJ/ICA"
maskdir="${rootdir}/tpl-MNIPediatricAsym_cohort-6_res-2_desc-brain_mask.nii.gz"
t1wbetdir="${rootdir}/tpl-MNIPediatricAsym_cohort-6_res-2_T1w_bet.nii"

# actigraphy paths first
melodic -i ${rootdir}/participants_paths_MW_32R.txt \
		-o ${rootdir}/GroupICA_MW_32R.gica \
		-m ${maskdir}\
		--bgimage=${t1wbetdir} \
		-d 25 \
		--tr=2.00 \
		--Oall \
		--verbose \
		--debug \
		--report

