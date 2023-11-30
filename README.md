# ENAHO-DATA
# Facilitar el uso de la base de datos de la ENAHO - 2022
# `enahodata` : Download National Household Survey on Living Conditions and Poverty data from INEI - Perú.

## Installation

```
cap ado uninstall enahodata 
net install enahodata, from(https://github.com/ManuelDF2398/ENAHO-DATA)
```

## Usage

Select a module of interest and year. Then, run:

```stata
 enahodata inei, modulo(01) año(2018)
 enahodata inei, modulo(34) año(2017)
```

## Notes

The data will be downloaded in zip format. It is necessary to create a folder.

- More information in the help file.
