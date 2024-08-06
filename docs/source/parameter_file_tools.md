# Modifying the Parameter File

FATES parameter files are netcdf files ending in .nc. To convert them to a human
readable format we use NCO tools. To convert from .nc to .cdl we use ncdump like this: 

```
ncdump fates_params_default.nc > fates_params_default.cdl 
```

To go the other way, and generate a .nc file from a .cdl file you've been editing you
can use ncgen like this: 

```
ncgen -o fates_params_default.cdl fates_params_default.nc
```

If you open the .cdl file you just generated you'll see that it has 12 PFTs listed 
under fates_pftname: 

```
fates_pftname =
  "broadleaf_evergreen_tropical_tree          ",
  "needleleaf_evergreen_extratrop_tree        ",
  "needleleaf_colddecid_extratrop_tree       ",
  "broadleaf_evergreen_extratrop_tree         ",
  "broadleaf_hydrodecid_tropical_tree         ",
  "broadleaf_colddecid_extratrop_tree        ",
  "broadleaf_evergreen_extratrop_shrub        ",
  "broadleaf_hydrodecid_extratrop_shrub       ", 
  "broadleaf_colddecid_extratrop_shrub       ",
  "arctic_c3_grass                            ",
  "cool_c3_grass                              ",
  "c4_grass                                   " ;
```

Since we are running FATES at a tropical site we don't want most of these PFTs to be
present since they are temperate and arctic PFTs. We can use the python script
FatesPFTIndexSwapper.py to make a new parameter file that only contains the 
tropical tree PFT that we  want in our simulations. We run this script from the command line
and provide three arguments, --fin  - the original parameter file, --fout - the new parameter
file, and --pft-indices - the index of the PFTs that  we want, in this case 1. 

```
./FatesPFTIndexSwapper.py --fin=fates_params_default.nc --fout=fates_params_1pft.nc --pft-indices=1
```

This generates a parameter file with a single PFT. Try converting the .nc file to a .cdl file you can
open and then check to see if it worked. 
