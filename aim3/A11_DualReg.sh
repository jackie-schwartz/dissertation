#!/bin/bash

#Filename: 	011_DualReg.bash
#Dir:		oak/stanford/groups/iang/users/schwartzJ/ICA

#Author: 	Jackie
#Date:		2020 25 Feb

#Purpose:	Run dual regression with your given subject list
#Notes:		
#			Run after A10_GroupICA.bash & picked the specific networks from GroupICA.gica/report
#			Type dual_regression --help for help
#			Copied from A10_GroupICA.sh
#			For *help*:
#				Type dual_regression --help
#				See http://fsl.fmrib.ox.ac.uk/fsl/fslwiki/DualRegression/UserGuide
#			note that: <design.mat> <design.con> can be replaced with just -1 for group-mean (one-group t-test) modelling.

# # change directory and txt file for actigraphy sample
dual_regression /oak/stanford/groups/iang/users/schwartzJ/ICA/GroupICA_MW_32R.gica/melodic_IC \
				1 \
				-1 \
				500 \
				 /oak/stanford/groups/iang/users/schwartzJ/ICA/DualReg_MW32R \ 
				`cat /oak/stanford/groups/iang/users/schwartzJ/ICA/participants_paths_MW_32R.txt`