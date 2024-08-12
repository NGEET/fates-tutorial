# Setting up FATES at a New Site


To set up FATES at a new site there are three things we need to change. 

1. The surface and domain files 
2. The climate forcing data
3. The parameter file (optional)

We have already make surface files, domain files and climate forcing data
for you and you will find them in your container under the inputdata 
directory. We provide the scripts needed to make these files and describe
them below but you don't need to run them during the tutorial. 

FATES will run with the same default tropical PFT parameeter file
that we used in lesson 2. We can start using this parameeter file
at the new sites, and then in lesson 5 we will modifty the parameter file. 


## Making custom surface and domain files

ELM-FATES is a global model and can be run anywhere on land. If we have
data on the environment at a site we can use it to customize the set up, 
if not, we can use global datasets and subset them to the location of interest. 

In the tools directory there is a jupyter notebook Make_surface_domain_files.ipynb 
that takes global surface and domain files and extracts the grid cell that 
contains the site where we want to run FATES. This script can be used to generate
surface and domain files for anywhere on land by changing the lat and lon 
variables at the top of the file. If we have detailed soils data we could use that 
to update the surface file, but for now we will use the default values from the 
global surface file which are from soils grid. 

## Making custom climate forcing data
If there are detailed climate data from nearby weather stations
then it is possible to generate site-specific met drivers. At a minimum FATES
needs 6-hourly data on temperature, solar radiation, precipitation, humidity and windspeed. 
If these data don't exist we can extract data
from global climate data. In the tools directory is the jupyter notebook Make_met_drivers.ipynb 
which takes global reanalysis data from GSWP3 and extracts data for the grid cell where
the site is located. Again, you do not need to run this script during the tutorial as all the
data is already extracted and located in the inputdata directory. 

## Modifying the create script

To get FATES to use these new files we need to point to them in the create script. We can 
do this by changing the 'Site' argument at the top of the script. 
