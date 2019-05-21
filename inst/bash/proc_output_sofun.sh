#!/bin/bash

# proc_sitescale_site(){
	## Combines output files, written for each year, along time axis. For one specific site.

	## 1. argument: runname/site name
	## 2. argument: output directory

	if [ -z `which cdo` ]
	then
	  echo "Using NCO for processing NetCDF files"

		## Make 'time' the record dimension on all files
	  filelist=`ls $2/$1.*.*.*.nc`
	  for ifil in $filelist; do
			ncks -O --mk_rec_dmn time $ifil $ifil
	  done

		##-------------------------------------
		## Daily
		##-------------------------------------		
		## GPP
		ncrcat -O $2/$1.*.d.gpp.nc $2/$1.d.gpp.nc
		rm $2/$1.*.d.gpp.nc

		## Net radiation
		ncrcat -O $2/$1.*.d.netrad.nc $2/$1.d.netrad.nc
		rm $2/$1.*.d.netrad.nc

		## TRANSP
		ncrcat -O $2/$1.*.d.transp.nc $2/$1.d.transp.nc
		rm $2/$1.*.d.transp.nc

		## AET
		ncrcat -O $2/$1.*.d.pet.nc $2/$1.d.pet.nc
		rm $2/$1.*.d.pet.nc

		## PET
		ncrcat -O $2/$1.*.d.aet.nc $2/$1.d.aet.nc
		rm $2/$1.*.d.aet.nc

		## WBAL (water balance)
		ncrcat -O $2/$1.*.d.wbal.nc $2/$1.d.wbal.nc
		rm $2/$1.*.d.wbal.nc

		## WCONT
		ncrcat -O $2/$1.*.d.wcont.nc $2/$1.d.wcont.nc
		rm $2/$1.*.d.wcont.nc

		## fAPAR
		ncrcat -O $2/$1.*.d.fapar.nc $2/$1.d.fapar.nc
		rm $2/$1.*.d.fapar.nc

		## SOIL TEMPERATURE
		ncrcat -O $2/$1.*.d.temp_soil.nc $2/$1.d.temp_soil.nc
		rm $2/$1.*.d.temp_soil.nc

		## TEMPERATURE
		ncrcat -O $2/$1.*.d.temp.nc $2/$1.d.temp.nc
		rm $2/$1.*.d.temp.nc

		##-------------------------------------
		## Annual
		##-------------------------------------
		## GPP
		ncrcat -O $2/$1.*.a.gpp.nc $2/$1.a.gpp.nc
		rm $2/$1.*.a.gpp.nc

		## AET
		ncrcat -O $2/$1.*.a.pet.nc $2/$1.a.pet.nc
		rm $2/$1.*.a.pet.nc

		## PET
		ncrcat -O $2/$1.*.a.aet.nc $2/$1.a.aet.nc
		rm $2/$1.*.a.aet.nc

		## WCONT
		ncrcat -O $2/$1.*.a.wcont.nc $2/$1.a.wcont.nc
		rm $2/$1.*.a.wcont.nc

		## fAPAR
		ncrcat -O $2/$1.*.a.fapar.nc $2/$1.a.fapar.nc
		rm $2/$1.*.a.fapar.nc

		## PPFD
		ncrcat -O $2/$1.*.a.ppfd.nc $2/$1.a.ppfd.nc
		rm $2/$1.*.a.ppfd.nc

		## TEMPERATURE
		ncrcat -O $2/$1.*.a.temp.nc $2/$1.a.temp.nc
		rm $2/$1.*.a.temp.nc

		## ALPHA (AET/PET)
		ncrcat -O $2/$1.*.a.alpha.nc $2/$1.a.alpha.nc
		rm $2/$1.*.a.alpha.nc	

	else
	  echo "Using CDO for processing NetCDF files"
		##-------------------------------------
		## Daily
		##-------------------------------------
		## GPP
		cdo -O mergetime $2/$1.*.d.wcont.nc $2/$1.d.wcont.nc
		rm $2/$1.*.d.wcont.nc

		## Net radiation
		cdo -O mergetime $2/$1.*.d.netrad.nc $2/$1.d.netrad.nc
		rm $2/$1.*.d.netrad.nc

		## TRANSP
		cdo -O mergetime $2/$1.*.d.transp.nc $2/$1.d.transp.nc
		rm $2/$1.*.d.transp.nc

		## AET
		cdo -O mergetime $2/$1.*.d.pet.nc $2/$1.d.pet.nc
		rm $2/$1.*.d.pet.nc

		## PET
		cdo -O mergetime $2/$1.*.d.aet.nc $2/$1.d.aet.nc
		rm $2/$1.*.d.aet.nc

		## wbal
		cdo -O mergetime $2/$1.*.d.wbal.nc $2/$1.d.wbal.nc
		rm $2/$1.*.d.wbal.nc

		## WCONT
		cdo -O mergetime $2/$1.*.d.gpp.nc $2/$1.d.gpp.nc
		rm $2/$1.*.d.gpp.nc

		## fAPAR
		cdo -O mergetime $2/$1.*.d.fapar.nc $2/$1.d.fapar.nc
		rm $2/$1.*.d.fapar.nc

		## SOIL TEMPERATURE
		cdo -O mergetime $2/$1.*.d.temp_soil.nc $2/$1.d.temp_soil.nc
		rm $2/$1.*.d.temp_soil.nc

		## TEMPERATURE
		cdo -O mergetime $2/$1.*.d.temp.nc $2/$1.d.temp.nc
		rm $2/$1.*.d.temp.nc


		##-------------------------------------
		## Annual
		##-------------------------------------
		## GPP
		cdo -O mergetime $2/$1.*.a.wcont.nc $2/$1.a.wcont.nc
		rm $2/$1.*.a.wcont.nc

		## AET
		cdo -O mergetime $2/$1.*.a.pet.nc $2/$1.a.pet.nc
		rm $2/$1.*.a.pet.nc

		## PET
		cdo -O mergetime $2/$1.*.a.aet.nc $2/$1.a.aet.nc
		rm $2/$1.*.a.aet.nc

		## WCONT
		cdo -O mergetime $2/$1.*.a.gpp.nc $2/$1.a.gpp.nc
		rm $2/$1.*.a.gpp.nc

		## fAPAR
		cdo -O mergetime $2/$1.*.a.fapar.nc $2/$1.a.fapar.nc
		rm $2/$1.*.a.fapar.nc

		## PPFD
		cdo -O mergetime $2/$1.*.a.ppfd.nc $2/$1.a.ppfd.nc
		rm $2/$1.*.a.ppfd.nc

		## TEMPERATURE
		cdo -O mergetime $2/$1.*.a.temp.nc $2/$1.a.temp.nc
		rm $2/$1.*.a.temp.nc

		## ALPHA (AET/PET)
		cdo -O mergetime $2/$1.*.a.alpha.nc $2/$1.a.alpha.nc
		rm $2/$1.*.a.alpha.nc	
	fi


# 	return 0
# }

# proc_global(){
# 	## Combines output files, written for each year, along time axis. For one specific site.

# 	## 1. argument runname/site name

# 	##-------------------------------------
# 	## Daily
# 	##-------------------------------------
# 	## GPP
# 	cdo -O mergetime $2/$1.*.d.gpp.nc $2/$1.d.gpp.nc
# 	rm $2/$1.*.d.gpp.nc

# 	## Soil water content
# 	cdo -O mergetime $2/$1.*.d.wcont.nc $2/$1.d.wcont.nc
# 	rm $2/$1.*.d.wcont.nc

# 	##-------------------------------------
# 	## Annual
# 	##-------------------------------------
# 	## AET
# 	cdo -O mergetime $2/$1.*.a.pet.nc $2/$1.a.pet.nc
# 	rm $2/$1.*.a.pet.nc

# 	## PET
# 	cdo -O mergetime $2/$1.*.a.aet.nc $2/$1.a.aet.nc
# 	rm $2/$1.*.a.aet.nc

# 	## ALPHA (AET/PET)
# 	cdo -O mergetime $2/$1.*.a.alpha.nc $2/$1.a.alpha.nc
# 	rm $2/$1.*.a.alpha.nc	

# 	return 0
# }

# proc_sitescale_simsuite(){
# 	## Combines output files, written for each year, along time axis. For an entire simulation suite.
# 	## Uses ./sitelist.txt for a list of sites. Create this file using get_sitelist_simsuite.py

# 	python get_sitelist_simsuite.py

# 	sitelist=`cat sitelist.txt` 

# 	for idx in $sitelist
# 	do
# 		if [[ -e $1/$idx.d.gpp.nc ]]
# 		then
# 			echo "NetCDF output already processed for site $idx"
# 		else
# 			echo "PROCESSING SITE $idx"
# 			proc_sitescale_site $idx
# 		fi
# 	done

# 	return 0
# }


