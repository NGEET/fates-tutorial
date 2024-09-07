# Modifying the Parameter File

FATES parameter files are netcdf files ending in .nc. To convert them to a human
readable format we use NCO tools. To convert from .nc to .cdl we use ncdump like this: 

```
ncdump fates_params_default.nc > fates_params_default.cdl 
```

To go the other way, and generate a .nc file from a .cdl file you've been editing you
can use ncgen like this: 

```
ncgen -o fates_params_default.nc fates_params_default.cdl
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

Since we are running FATES at a tropical site we don't want the temperate and  arctic PFTs to be present.
We can use the python script FatesPFTIndexSwapper.py to make a new parameter file that only contains the 
tropical tree PFT that we  want in our simulations. We run this script from the command line
and provide three arguments, --fin  - the original parameter file, --fout - the new parameter
file, and --pft-indices - the index of the PFTs that  we want, in this case 1. 

```
./FatesPFTIndexSwapper.py --fin=fates_params_default.nc --fout=fates_params_default-1pft.nc --pft-indices=1
```

This generates a parameter file with a single PFT. Try converting the .nc file to a .cdl file you can
open and then check to see if it worked. 

It is also possible to make a parameter file with two copies of a PFT. This is useful if we want to make
a parameter file with two PFTs that grow in the same place  but vary in their traits. In lesson five we want
to run FATES at each of our sites with two competing  PFTs, an early successional and a late succesional. 

To do this we run the same script as above but we specify that we want pft 1 repeated.

```
./FatesPFTIndexSwapper.py --fin=fates_params_default.nc --fout=fates_params_2pfts.nc --pft-indices=1,1
```

Now turn that new file into a .cdl file that is human readable using the NCO scripts described above: 

```
ncdump fates_params_2pfts.nc > fates_params_2pfts.cdl
```

Now you can open the file using your favourite text editor and make changes to one or both of the PFTs. 
Keep in mind  the trade-offs we discussed earlier. 

When you have finished editing your parameter  file make a .nc version using ncgen. 

```
ncgen -o fates_params_2pfts.nc fates_params_2pfts.cdl
```

Be sure to point to this new parameter file in your create script!!! 
