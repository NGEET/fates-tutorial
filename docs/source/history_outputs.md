# FATES History Outputs

By default FATES produces monthly files that record the state of the forest. These are saved in the output directory as elm.h0. files. To 
change the frequency that the files are written out, or the resolution of the outputs we can change two arguments in the user_nl_elm file
by editing our create script. The frequency of the history file streams is given by the namelist variable
hist_nhtfrq. The values of hist_nhtfrq must be integers, where the following values have the given meaning:Positive value means the output
frequency is the number of model steps between output. Negative value means the output frequency is the absolute
value in hours given (i.e -1 would mean an hour and -24 would mean a full day). Zero means the output frequency is monthly.
The number of samples on each history file stream is given by the namelist variable hist_mfilt. Examples are given in the table below.  


| File frequency | Time stamp | hist_nhtfrq | hist_mfilt | Description |
| -------------- | ---------- | ----------- | ---------- | ----------- |
| Annual         | Annual     | -8760       | 1          | Annual outputs written out yearly | 
| Annual         | Monthly    | 0           | 12         | Monthly outputs written out yearly | 
| Annual         | Daily      | -24         | 365        | Daily outputs written out yearly |  
| Annual         | Daily      | -1          | 8760       | Daily outputs written out yearly |  
| Monthly        | Monthly    | 0           | 1          | DEFAULT  Monthly outputs written out monthly |  
| Daily          | Daily      | -24         | 1          | Daily outputs written out daily |  
| Daily          | Hourly     | -1          | 24         | Daily outputs written out hourly |  
| Hourly         | Hourly     | -1          | 1          | Hourly outputs written out hourly |  
| Five years     | monthly    | 0           | 60         | Monthly outputs written out every five years |  
| Ten years      | annualy    | -8760       | 10         | Annual outputs written out every ten years |  


By default FATES will output monthly files, containing values that are the average value for that month. To visualize the simulation we want to
read a single file into Python or R, with all the months combined. To do this we use the NCO tool ncrcat.

```
ncrcat -h fates_tag.elm.h0.*.nc  fates_tag.sofar.nc
```

The -h flag tells ncrcat not to copy meta  data from the input files to the new file. The * tells ncrcat to combine all files  that have elm.h0.
in the name, regardless of the date. fates_tag  should be replaced by the full name of your FATES simulation. The new file ending .sofar.nc contains
the full time  series of the model run and can be loaded into R or Python to make figures.

To see examples of R and Python scripts that plot  FATES outputs go to the Jupyter book lesson 3. 