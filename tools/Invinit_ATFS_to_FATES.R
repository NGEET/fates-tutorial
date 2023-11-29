#############################################################################
#### This script reads in standard ForestGEO data and converts it to
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
load('/Users/JFNeedham/Desktop/Inventory_initialisation_ForestGEO_to_FATES/SCBISubsetFormated.rda')
df_full = SCBISubsetFormated  # change to the name of your data

#### 2. Pick the most recent census and remove dead trees ####
n.census = max(df_full$IdCensus, na.rm=TRUE)
df = SCBISubsetFormated[SCBISubsetFormated$IdCensus == n.census, ]
df = df[df$Original_status == 'A', ]

# plot area 
plot_area = df$PlotArea

# plot name
plot_name = df$Site[1]
# plot year
plot_year = as.numeric(stri_sub(df$Date[1], from = 1, to = 4))

#############################################################################
#### 3. Make patches ####
npatches = length(unique(df$Subplot))
# when was each patch measured - this isn't used by FATES so the year of the census is fine
time = rep(plot_year, npatches)
patch_df = as.data.frame(time)

# unique patch code
patch_df$patch = unique(df$Subplot)

# is this patch secondary or primary - 
# here we assume  primary for all subplots, but if  this information is available  then change
# the lines below
# 0  = non forest, 1 = secondary, 2 = primary
patch_df$trk = rep(2, npatches)

# time since the patch was created - can be set to 0
patch_df$age = rep(0, npatches)

# fraction of the site occupied by the patch
patch_df$area = rep((1/npatches), npatches)

write.csv(patch_df, sprintf('%s_%i.pss', plot_name, plot_year))

#############################################################################
#### 3. Make cohorts #### 
time = df$Date
co_df = as.data.frame(time)
co_df$patch = df$Subplot
co_df$dbh = df$Diameter
co_df$height = -3
co_df$pft = 1
co_df$n = 1/plot_area

write.csv(co_df, sprintf('%s_%i.css', plot_name, plot_year))
