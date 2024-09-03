#############################################################################
#### This script reads in BCI data from dryad and converts it to
#### a format that can be read in by FATES for inventory initialisation #####

# 1. Load R data table  
# 2. Make patches 
#    - Assign patch age, area, and land use type
# 3. Make cohorts
#    - Assign cohorts to patches
#    - Assign PFTs to species
#    - Remove dead trees
#    - Combine individuals into cohorts
#############################################################################
rm(list=ls())

#### Libraries ####
library(stringi)

#############################################################################
#### 1. Load Data ####
# Load the plot data
load('FILE_PATH_TO_YOUR_DATA/YOUR_DATA.rdata')
df_full = YOUR_DATA_OBJECT  

### SUBSET DATA - to speed up FATES runs we are only going to read in a single ha of data. 
### If your dataset is very large (>10 ha) consider doing this too during the tutorial.  
### For full simulations you should use the full dataset. 

### To get a single quadrat we select all stems with x and y coordinates less than 100 m 
df = df_full[which(df_full$gx <= 100 & df_full$gy <= 100), ]

#### 2. Remove dead trees ####
df = df[df$status == 'A', ]

# plot area
plot_area = 1
# plot name
plot_name = 'BCI'
# plot year
plot_year = 2015 # when was the census started 

# units - conversion for dbh column - use the below values: 
# cm - 1
# mm - 0.1
# m - 100
units = 0.1

#############################################################################
#### 3. Make patches ####
npatches = length(unique(df$quadrat))
# when was each patch measured - this isn't used by FATES so the year of the census is fine
time = rep(plot_year, npatches)
patch_df = as.data.frame(time)

# unique patch code
patch_df$patch = as.numeric(unique(df$quadrat))

# is this patch secondary or primary - 
# here we assume  primary for all subplots, but if  this information is available  then change
# the lines below
# 0  = non forest, 1 = secondary, 2 = primary
patch_df$trk = rep(2, npatches)

# time since the patch was created - can be set to 0
patch_df$age = rep(0.0, npatches)

# fraction of the site occupied by the patch
patch_df$area = rep((1/npatches), npatches)

### CHANGE THE FILE PATH HERE ###
write.table(patch_df, sprintf('FILE_PATH_TO_YOUR_FOLDER/%s_%i.pss',  plot_name, plot_year), 
            row.names=FALSE, sep = " ")

#############################################################################
#### 3. Make cohorts #### 

# time is not used by FATES so just use the census year
time = rep(plot_year, nrow(df))
co_df = as.data.frame(time)

# which patch is this cohort in? 
co_df$patch = as.numeric(df$quadrat)
# convert dbh to cm
co_df$dbh = df$dbh  * units 
# set to a negative number - either dbh or height can be read in 
# by FATES, the other needs to be negative
co_df$height = -1.0
# Assume all trees belong to a single PFT
co_df$pft = 1
# Get the number density of cohorts
patch_size=plot_area * 10000 / npatches
co_df$nplant = 1/patch_size

# check that all trees have a dbh - if not then remove them!
cut = which(is.na(co_df$dbh)==TRUE)
if(length(cut) > 0){
  co_df = co_df[-cut, ]
}

### CHANGE THE FILE PATH HERE ###
write.table(co_df, sprintf('FILE_PATH_TO_YOUR_FOLDER/%s_%i.css', plot_name, plot_year), 
         row.names=FALSE, sep = ' ')
