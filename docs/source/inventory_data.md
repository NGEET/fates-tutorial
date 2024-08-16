# Formatting Inventory Data

During the tutorial you will have the opportunity to run FATES at a location of your choice - so long as you choose somewhere that is a) on land, b) a forest,
and c) a place where you have inventory data that can be used to initialize FATES. Inventory data will remain on your laptop and will not be shared with anyone
else at the tutorial, including the mentors. We ask that you make sure you have permission from all the appropriate people before using any inventory data. If
you do not have inventory data or a specific study site you can use publicly available data to run FATES. 

## Instructions for formatting data

FATES reads inventory data as two text files, one describing the cohort structure - how many stems of each size in each patch, and one describing the patch
structure - how many patches and the area of each patch. 

On the FATES tutorial GitHub repo you will find an R script under tools [make_inventory_init_files.R](https://github.com/NGEET/fates-tutorial/blob/main/tools/make_inventory_init_files.R) 
that takes inventory data and creates these two files.
For the script to work your data need to be organized as a dataframe with a single row per tree. Columns should be as follows:

| Column | Description | 
| -------| ------------| 
| status | Alive or dead. An 'A' should indicate an alive stem. All other codes will be ignored. |  
| quadrat | The quadrat or subplot of the stem. Each quadrat needs a unique code or number. |
| dbh | The Diameter of the tree. This can be in mm, cm or m, but be sure to adjust the units in the top section of the script. | 
| gx | X coordinate of the stem - in m from one corner of the plot | 
| gy | Y coordinate of the stem - in m from one corner of the plot | 


As noted in the R script, inventory initialization can be slow if you have a large data set (~30 mins for the full 50 ha of BCI data). 
In the script we therefore select a single ha to use for the tutorial. We suggest that for the tutorial you do the same if you have
a large dataset (>20 ha). 

Before running the script you will need to open it and change the file path to where your data is stored, as well as file paths to
where you want to save the files that are generated. We suggest making a folder called 'inventory_data_fates_tutorial' or something
else descriptive and pointing to that in the R script. You also need to update the site name, the plot size (remember to set this 
to whatever subset of the data you actually use), and the units for dbh measurements. 
