### Unzip ###

# Abstract
for (( yr=2000; yr<2017; yr++ )); do
  unzip $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY$yr.zip
done
for (( ext=1; ext<10; ext++ )); do
  unzip $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY2017_00$ext.zip
done
for (( ext=10; ext<53; ext++ )); do
  unzip $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY2017_0$ext.zip
done
for (( ext=1; ext<7; ext++ )); do
  unzip $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY2018_00$ext.zip
done

# Project
for (( yr=2000; yr<2017; yr++ )); do
  unzip $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY$yr.zip
done
for (( ext=1; ext<10; ext++ )); do
  unzip $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY2017_00$ext.zip
done
for (( ext=10; ext<53; ext++ )); do
  unzip $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY2017_0$ext.zip
done
for (( ext=1; ext<7; ext++ )); do
  unzip $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY2018_00$ext.zip
done

### Concatnate ###
# in python
import pandas as pd
import os

fs = os.listdir("Data/Abstract/")
abst = [pd.read_csv("Data/Abstract/" + f) for f in fs if ".csv" in f]
abstract = pd.concat(abst, ignore_index=True)
abstract.to_csv("Data/Abstract/RePORTER_PRJABS.csv")

fs = os.listdir("Data/Project/")
proj = [pd.read_csv("Data/Project/" + f, low_memory=False) for f in fs if ".csv" in f]
project = pd.concat(proj, ignore_index=True)
project.to_csv("Data/Project/RePORTER_PRJ.csv")


### Concatnate 2014 - 2017 ###
# 2009/ 2012/ 2014
outFile=$HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_2014_2017.csv
cat $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY2014.csv > $outFile
for (( yr=2015; yr<2017; yr++ )); do
  echo $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY$yr.csv
  tail -n +2 $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY$yr.csv >> $outFile
done
for (( ext=1; ext<10; ext++ )); do
  tail -n +2 $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY2017_00$ext.csv >> $outFile
  echo $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY2017_00$ext.csv
done
for (( ext=10; ext<53; ext++ )); do
  tail -n +2 $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY2017_0$ext.csv >> $outFile
  echo $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY2017_0$ext.csv
done
for (( ext=1; ext<7; ext++ )); do
  tail -n +2 $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY2018_00$ext.csv >> $outFile
  echo $HOME/NIH_Exporter/Data/Abstract/RePORTER_PRJABS_C_FY2018_00$ext.csv
done

outFile=$HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_2014_2017.csv
cat $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY2014.csv > $outFile
for (( yr=2015; yr<2017; yr++ )); do
  tail -n +2 $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY$yr.csv >> $outFile
  echo $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY$yr.csv
done
for (( ext=1; ext<10; ext++ )); do
  tail -n +2 $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY2017_00$ext.csv >> $outFile
  echo $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY2017_00$ext.csv
done
for (( ext=10; ext<53; ext++ )); do
  tail -n +2 $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY2017_0$ext.csv >> $outFile
  echo $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY2017_0$ext.csv
done
for (( ext=1; ext<7; ext++ )); do
  tail -n +2 $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY2018_00$ext.csv >> $outFile
  echo $HOME/NIH_Exporter/Data/Project/RePORTER_PRJ_C_FY2018_00$ext.csv
done


