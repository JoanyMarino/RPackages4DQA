---
# DQAstats - Perform data quality assessment (DQA) of electronic health
# records (EHR)
# Copyright (C) 2019-2022 Universitätsklinikum Erlangen
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


title: "Data Quality Report: Comparison of ship and ship"
subtitle: "No time restriction. All available data were analysed"
author: "(c) Universitätsklinikum Erlangen"
date: \today
geometry: 'left=2.5cm,right=2.5cm,top=2cm,bottom=2cm' 
output: 
  pdf_document:
    toc: true
    toc_depth: 2
    number_sections: true
    includes:
      in_header: "./_header/header.tex"
    keep_tex: true
    pandoc_args:  [
                    "--variable", "graphics=yes",
                    "--variable", "compact-title=yes"
                  ]

---



\newpage

# Data Map

## Target Data System

There is no data to display.

## Source Data System

There is no data to display.

\newpage

# Completeness Checks 

## Validation 

Completeness checks (validation) evaluate the ETL (extract transform load) jobs. They compare for each variable the exact matching of the number of distinct values, the number of valid values (=n), and the number of missing values between the source data system and the target data system.  

\begin{table}[H]
\centering
\begin{tabular}{l|l|l|l}
\hline
\textbf{Variable} & \textbf{Check Distincts} & \textbf{Check Valids} & \textbf{Check Missings}\\
\hline
age & passed & passed & passed\\
\hline
cholesterol & passed & passed & passed\\
\hline
contraception & passed & passed & passed\\
\hline
dbp1 & passed & passed & passed\\
\hline
dbp2 & passed & passed & passed\\
\hline
dev\_bp & passed & passed & passed\\
\hline
dev\_length & passed & passed & passed\\
\hline
dev\_weight & passed & passed & passed\\
\hline
diab\_age & passed & passed & passed\\
\hline
diab\_known & passed & passed & passed\\
\hline
exdate & passed & passed & passed\\
\hline
family & passed & passed & passed\\
\hline
hdl & passed & passed & passed\\
\hline
height & passed & passed & passed\\
\hline
id & passed & passed & passed\\
\hline
income & passed & passed & passed\\
\hline
ldl & passed & passed & passed\\
\hline
myocard & passed & passed & passed\\
\hline
obs\_bp & passed & passed & passed\\
\hline
obs\_int & passed & passed & passed\\
\hline
obs\_soma & passed & passed & passed\\
\hline
sbp1 & passed & passed & passed\\
\hline
sbp2 & passed & passed & passed\\
\hline
school & passed & passed & passed\\
\hline
sex & passed & passed & passed\\
\hline
smoking & passed & passed & passed\\
\hline
stroke & passed & passed & passed\\
\hline
waist & passed & passed & passed\\
\hline
weight & passed & passed & passed\\
\hline
\end{tabular}
\end{table}

## Verification 

\begin{table}[H]
\centering
\begin{tabular}{l|l|l}
\hline
\textbf{Variable} & \textbf{Missings [\%] (source)} & \textbf{Missings [\%] (target)}\\
\hline
age & 0 & 0\\
\hline
cholesterol & 0.7 & 0.7\\
\hline
contraception & 0 & 0\\
\hline
dbp1 & 0.09 & 0.09\\
\hline
dbp2 & 0.28 & 0.28\\
\hline
dev\_bp & 0 & 0\\
\hline
dev\_length & 0 & 0\\
\hline
dev\_weight & 0 & 0\\
\hline
diab\_age & 0 & 0\\
\hline
diab\_known & 0 & 0\\
\hline
exdate & 0 & 0\\
\hline
family & 0 & 0\\
\hline
hdl & 0.74 & 0.74\\
\hline
height & 0.14 & 0.14\\
\hline
id & 0 & 0\\
\hline
income & 0 & 0\\
\hline
ldl & 1.3 & 1.3\\
\hline
myocard & 0 & 0\\
\hline
obs\_bp & 0 & 0\\
\hline
obs\_int & 0 & 0\\
\hline
obs\_soma & 0 & 0\\
\hline
sbp1 & 0.09 & 0.09\\
\hline
sbp2 & 0.28 & 0.28\\
\hline
school & 0 & 0\\
\hline
sex & 0 & 0\\
\hline
smoking & 0 & 0\\
\hline
stroke & 0 & 0\\
\hline
waist & 0.28 & 0.28\\
\hline
weight & 0.19 & 0.19\\
\hline
\end{tabular}
\end{table}

\newpage

# Conformance Checks

## Value Conformance

Value conformance checks (verification) compare for each variable the values of each data system to predefined constraints. Those constraints can be defined for each variable and data system individually in the metadata repository (MDR).

\begin{table}[H]
\centering
\begin{tabular}{l|l|l}
\hline
\textbf{Variable} & \textbf{Check Source Data} & \textbf{Check Target Data}\\
\hline
age & failed & failed\\
\hline
cholesterol & passed & passed\\
\hline
contraception & failed & failed\\
\hline
dbp1 & failed & failed\\
\hline
dbp2 & passed & passed\\
\hline
dev\_bp & failed & failed\\
\hline
dev\_length & failed & failed\\
\hline
dev\_weight & failed & failed\\
\hline
diab\_known & failed & failed\\
\hline
exdate & passed & passed\\
\hline
family & failed & failed\\
\hline
hdl & passed & passed\\
\hline
height & passed & passed\\
\hline
id & passed & passed\\
\hline
income & failed & failed\\
\hline
ldl & passed & passed\\
\hline
myocard & failed & failed\\
\hline
obs\_bp & failed & failed\\
\hline
obs\_int & failed & failed\\
\hline
obs\_soma & failed & failed\\
\hline
sbp1 & failed & failed\\
\hline
sbp2 & failed & failed\\
\hline
school & failed & failed\\
\hline
sex & passed & passed\\
\hline
smoking & failed & failed\\
\hline
stroke & failed & failed\\
\hline
waist & passed & passed\\
\hline
weight & passed & passed\\
\hline
a\_present\_and\_b\_vv & failed & failed\\
\hline
a\_present\_and\_b\_levels\_vl & failed & failed\\
\hline
\end{tabular}
\end{table}


\newpage

# Detailed Descriptive Analysis


## age  

Description for dataelement 'age'  

### Representation in **source** data system  

- Variable: age
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: age
- Variable type: integer  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 64  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 49.86\\
\hline
Minimum & 19\\
\hline
Median & 50\\
\hline
Maximum & 82\\
\hline
SD & 16.19\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2154\\
\hline
OutLo & 0\\
\hline
OutHi & 0\\
\hline
Variance & 261.95\\
\hline
Range & 63\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l}
\hline
\textbf{min} & \textbf{max}\\
\hline
20 & Inf\\
\hline
\end{tabular}
\end{table}

-  Extrem values are not conform with constraints.  
  
\newpage
### Representation in **target** data system  

- Variable: age
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: age
- Variable type: integer  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 64  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 49.86\\
\hline
Minimum & 19\\
\hline
Median & 50\\
\hline
Maximum & 82\\
\hline
SD & 16.19\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2154\\
\hline
OutLo & 0\\
\hline
OutHi & 0\\
\hline
Variance & 261.95\\
\hline
Range & 63\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l}
\hline
\textbf{min} & \textbf{max}\\
\hline
20 & Inf\\
\hline
\end{tabular}
\end{table}

-  Extrem values are not conform with constraints.  
  
\newpage
## cholesterol  

Description for dataelement 'cholesterol'  

### Representation in **source** data system  

- Variable: cholesterol
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: cholesterol
- Variable type: float  
    + n: 2154
    + Valid values: 2139
    + Missing values: 15
    + Distinct values: 1668  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 5.76\\
\hline
Minimum & 2.67\\
\hline
Median & 5.68\\
\hline
Maximum & 12.12\\
\hline
SD & 1.2\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2139\\
\hline
OutLo & 0\\
\hline
OutHi & 23\\
\hline
Variance & 1.43\\
\hline
Range & 9.45\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l}
\hline
\textbf{min} & \textbf{max}\\
\hline
0 & Inf\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
### Representation in **target** data system  

- Variable: cholesterol
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: cholesterol
- Variable type: float  
    + n: 2154
    + Valid values: 2139
    + Missing values: 15
    + Distinct values: 1668  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 5.76\\
\hline
Minimum & 2.67\\
\hline
Median & 5.68\\
\hline
Maximum & 12.12\\
\hline
SD & 1.2\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2139\\
\hline
OutLo & 0\\
\hline
OutHi & 23\\
\hline
Variance & 1.43\\
\hline
Range & 9.45\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l}
\hline
\textbf{min} & \textbf{max}\\
\hline
0 & Inf\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
## contraception  

Description for dataelement 'contraception': 

1 = yes; 2 = no  

### Representation in **source** data system  

- Variable: contraception
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: contraception
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 4  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{contraception} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
99801 & 1264 & 58.682\\
\hline
1 & 584 & 27.112\\
\hline
2 & 302 & 14.020\\
\hline
99900 & 4 & 0.186\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2 '
-  Levels that are not conform with the value set:  
99801  
99900  
  
\newpage
### Representation in **target** data system  

- Variable: contraception
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: contraception
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 4  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{contraception} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
99801 & 1264 & 58.682\\
\hline
1 & 584 & 27.112\\
\hline
2 & 302 & 14.020\\
\hline
99900 & 4 & 0.186\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2 '
-  Levels that are not conform with the value set:  
99801  
99900  
  
\newpage
## dbp1  

Description for dataelement 'dbp1'  

### Representation in **source** data system  

- Variable: dbp1
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: dbp1
- Variable type: integer  
    + n: 2154
    + Valid values: 2152
    + Missing values: 2
    + Distinct values: 75  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 84.52\\
\hline
Minimum & 53\\
\hline
Median & 84\\
\hline
Maximum & 198\\
\hline
SD & 11.81\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2152\\
\hline
OutLo & 0\\
\hline
OutHi & 17\\
\hline
Variance & 139.52\\
\hline
Range & 145\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r}
\hline
\textbf{min} & \textbf{max}\\
\hline
40 & 160\\
\hline
\end{tabular}
\end{table}

-  Extrem values are not conform with constraints.  
  
\newpage
### Representation in **target** data system  

- Variable: dbp1
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: dbp1
- Variable type: integer  
    + n: 2154
    + Valid values: 2152
    + Missing values: 2
    + Distinct values: 75  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 84.52\\
\hline
Minimum & 53\\
\hline
Median & 84\\
\hline
Maximum & 198\\
\hline
SD & 11.81\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2152\\
\hline
OutLo & 0\\
\hline
OutHi & 17\\
\hline
Variance & 139.52\\
\hline
Range & 145\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r}
\hline
\textbf{min} & \textbf{max}\\
\hline
40 & 160\\
\hline
\end{tabular}
\end{table}

-  Extrem values are not conform with constraints.  
  
\newpage
## dbp2  

Description for dataelement 'dbp2'  

### Representation in **source** data system  

- Variable: dbp2
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: dbp2
- Variable type: integer  
    + n: 2154
    + Valid values: 2148
    + Missing values: 6
    + Distinct values: 71  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 83.52\\
\hline
Minimum & 55\\
\hline
Median & 83\\
\hline
Maximum & 151\\
\hline
SD & 11.52\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2148\\
\hline
OutLo & 0\\
\hline
OutHi & 17\\
\hline
Variance & 132.67\\
\hline
Range & 96\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r}
\hline
\textbf{min} & \textbf{max}\\
\hline
40 & 160\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
### Representation in **target** data system  

- Variable: dbp2
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: dbp2
- Variable type: integer  
    + n: 2154
    + Valid values: 2148
    + Missing values: 6
    + Distinct values: 71  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 83.52\\
\hline
Minimum & 55\\
\hline
Median & 83\\
\hline
Maximum & 151\\
\hline
SD & 11.52\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2148\\
\hline
OutLo & 0\\
\hline
OutHi & 17\\
\hline
Variance & 132.67\\
\hline
Range & 96\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r}
\hline
\textbf{min} & \textbf{max}\\
\hline
40 & 160\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
## dev_bp  

Description for dataelement 'dev_bp': 

1 = Dev_01; 2 = Dev_02; 3 = Dev_03; 4 = Dev_04; 5 = Dev_05; 6 = Dev_06; 7 = Dev_07; 8 = Dev_08; 9 = Dev_09; 10 = Dev_10; 11 = Dev_11; 12 = Dev_12; 13 = Dev_13; 14 = Dev_14; 15 = Dev_15; 16 = Dev_16; 17 = Dev_17; 18 = Dev_18; 19 = Dev_19; 20 = Dev_20; 21 = Dev_21; 22 = Dev_22; 23 = Dev_23; 24 = Dev_24; 25 = Dev_25   

### Representation in **source** data system  

- Variable: dev_bp
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: dev_bp
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 12  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dev\_bp} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
10 & 444 & 20.613\\
\hline
9 & 381 & 17.688\\
\hline
15 & 265 & 12.303\\
\hline
18 & 257 & 11.931\\
\hline
16 & 235 & 10.910\\
\hline
20 & 214 & 9.935\\
\hline
17 & 156 & 7.242\\
\hline
22 & 109 & 5.060\\
\hline
19 & 88 & 4.085\\
\hline
99902 & 3 & 0.139\\
\hline
7 & 1 & 0.046\\
\hline
14 & 1 & 0.046\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 '
-  Levels that are not conform with the value set:  
99902  
  
\newpage
### Representation in **target** data system  

- Variable: dev_bp
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: dev_bp
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 12  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dev\_bp} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
10 & 444 & 20.613\\
\hline
9 & 381 & 17.688\\
\hline
15 & 265 & 12.303\\
\hline
18 & 257 & 11.931\\
\hline
16 & 235 & 10.910\\
\hline
20 & 214 & 9.935\\
\hline
17 & 156 & 7.242\\
\hline
22 & 109 & 5.060\\
\hline
19 & 88 & 4.085\\
\hline
99902 & 3 & 0.139\\
\hline
7 & 1 & 0.046\\
\hline
14 & 1 & 0.046\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 '
-  Levels that are not conform with the value set:  
99902  
  
\newpage
## dev_length  

Description for dataelement 'dev_length': 

1 = Dev_01; 2 = Dev_02; 3 = Dev_03; 4 = Dev_04; 5 = Dev_05; 6 = Dev_06; 7 = Dev_07; 8 = Dev_08; 9 = Dev_09; 10 = Dev_10; 11 = Dev_11; 12 = Dev_12; 13 = Dev_13; 14 = Dev_14; 15 = Dev_15; 16 = Dev_16; 17 = Dev_17; 18 = Dev_18; 19 = Dev_19; 20 = Dev_20; 21 = Dev_21; 22 = Dev_22; 23 = Dev_23; 24 = Dev_24; 25 = Dev_25   

### Representation in **source** data system  

- Variable: dev_length
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: dev_length
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 4  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dev\_length} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
3 & 1088 & 50.511\\
\hline
11 & 904 & 41.968\\
\hline
4 & 160 & 7.428\\
\hline
99902 & 2 & 0.093\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 '
-  Levels that are not conform with the value set:  
99902  
  
\newpage
### Representation in **target** data system  

- Variable: dev_length
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: dev_length
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 4  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dev\_length} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
3 & 1088 & 50.511\\
\hline
11 & 904 & 41.968\\
\hline
4 & 160 & 7.428\\
\hline
99902 & 2 & 0.093\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 '
-  Levels that are not conform with the value set:  
99902  
  
\newpage
## dev_weight  

Description for dataelement 'dev_weight': 

1 = Dev_01; 2 = Dev_02; 3 = Dev_03; 4 = Dev_04; 5 = Dev_05; 6 = Dev_06; 7 = Dev_07; 8 = Dev_08; 9 = Dev_09; 10 = Dev_10; 11 = Dev_11; 12 = Dev_12; 13 = Dev_13; 14 = Dev_14; 15 = Dev_15; 16 = Dev_16; 17 = Dev_17; 18 = Dev_18; 19 = Dev_19; 20 = Dev_20; 21 = Dev_21; 22 = Dev_22; 23 = Dev_23; 24 = Dev_24; 25 = Dev_25   

### Representation in **source** data system  

- Variable: dev_weight
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: dev_weight
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 4  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dev\_weight} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
1 & 1226 & 56.917\\
\hline
11 & 904 & 41.968\\
\hline
2 & 22 & 1.021\\
\hline
99902 & 2 & 0.093\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 '
-  Levels that are not conform with the value set:  
99902  
  
\newpage
### Representation in **target** data system  

- Variable: dev_weight
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: dev_weight
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 4  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dev\_weight} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
1 & 1226 & 56.917\\
\hline
11 & 904 & 41.968\\
\hline
2 & 22 & 1.021\\
\hline
99902 & 2 & 0.093\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 '
-  Levels that are not conform with the value set:  
99902  
  
\newpage
## diab_age  

Description for dataelement 'diab_age'  

### Representation in **source** data system  

- Variable: diab_age
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: diab_age
- Variable type: integer  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 49  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 91790.05\\
\hline
Minimum & 12\\
\hline
Median & 99801\\
\hline
Maximum & 99900\\
\hline
SD & 27115.85\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2154\\
\hline
OutLo & 173\\
\hline
OutHi & 7\\
\hline
Variance & 735269205.07\\
\hline
Range & 99888\\
\hline
\end{tabular}
\end{table}
\newpage
### Representation in **target** data system  

- Variable: diab_age
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: diab_age
- Variable type: integer  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 49  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 91790.05\\
\hline
Minimum & 12\\
\hline
Median & 99801\\
\hline
Maximum & 99900\\
\hline
SD & 27115.85\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2154\\
\hline
OutLo & 173\\
\hline
OutHi & 7\\
\hline
Variance & 735269205.07\\
\hline
Range & 99888\\
\hline
\end{tabular}
\end{table}
\newpage
## diab_known  

Description for dataelement 'diab_known': 

0 = no; 1 = yes  

### Representation in **source** data system  

- Variable: diab_known
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: diab_known
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 3  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{diab\_known} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
0 & 1946 & 90.344\\
\hline
1 & 201 & 9.331\\
\hline
99900 & 7 & 0.325\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 0, 1 '
-  Levels that are not conform with the value set:  
99900  
  
\newpage
### Representation in **target** data system  

- Variable: diab_known
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: diab_known
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 3  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{diab\_known} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
0 & 1946 & 90.344\\
\hline
1 & 201 & 9.331\\
\hline
99900 & 7 & 0.325\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 0, 1 '
-  Levels that are not conform with the value set:  
99900  
  
\newpage
## exdate  

Description for dataelement 'exdate'  

### Representation in **source** data system  

- Variable: exdate
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: exdate
- Variable type: datetime  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 688  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Min. & 1997-10-16\\
\hline
1st Qu. & 1998-08-18\\
\hline
Median & 1999-03-26\\
\hline
Mean & 1999-04-07\\
\hline
3rd Qu. & 1999-11-04\\
\hline
Max. & 2001-05-19\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: 'No future dates allowed.'  
  
\newpage
### Representation in **target** data system  

- Variable: exdate
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: exdate
- Variable type: datetime  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 688  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Min. & 1997-10-16\\
\hline
1st Qu. & 1998-08-18\\
\hline
Median & 1999-03-26\\
\hline
Mean & 1999-04-07\\
\hline
3rd Qu. & 1999-11-04\\
\hline
Max. & 2001-05-19\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: 'No future dates allowed.'  
  
\newpage
## family  

Description for dataelement 'family': 

1 = married; 2 = married (living apart); 3 = single (never married); 4 = divorced; 5 = widowed  

### Representation in **source** data system  

- Variable: family
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: family
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 7  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{family} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
1 & 1352 & 62.767\\
\hline
3 & 394 & 18.292\\
\hline
5 & 161 & 7.474\\
\hline
4 & 147 & 6.825\\
\hline
99914 & 60 & 2.786\\
\hline
2 & 33 & 1.532\\
\hline
99900 & 7 & 0.325\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5 '
-  Levels that are not conform with the value set:  
99900  
99914  
  
\newpage
### Representation in **target** data system  

- Variable: family
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: family
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 7  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{family} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
1 & 1352 & 62.767\\
\hline
3 & 394 & 18.292\\
\hline
5 & 161 & 7.474\\
\hline
4 & 147 & 6.825\\
\hline
99914 & 60 & 2.786\\
\hline
2 & 33 & 1.532\\
\hline
99900 & 7 & 0.325\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5 '
-  Levels that are not conform with the value set:  
99900  
99914  
  
\newpage
## hdl  

Description for dataelement 'hdl'  

### Representation in **source** data system  

- Variable: hdl
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: hdl
- Variable type: float  
    + n: 2154
    + Valid values: 2138
    + Missing values: 16
    + Distinct values: 1111  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 1.45\\
\hline
Minimum & 0.42\\
\hline
Median & 1.39\\
\hline
Maximum & 7.2\\
\hline
SD & 0.44\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2138\\
\hline
OutLo & 0\\
\hline
OutHi & 33\\
\hline
Variance & 0.19\\
\hline
Range & 6.78\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l}
\hline
\textbf{min} & \textbf{max}\\
\hline
0 & Inf\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
### Representation in **target** data system  

- Variable: hdl
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: hdl
- Variable type: float  
    + n: 2154
    + Valid values: 2138
    + Missing values: 16
    + Distinct values: 1111  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 1.45\\
\hline
Minimum & 0.42\\
\hline
Median & 1.39\\
\hline
Maximum & 7.2\\
\hline
SD & 0.44\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2138\\
\hline
OutLo & 0\\
\hline
OutHi & 33\\
\hline
Variance & 0.19\\
\hline
Range & 6.78\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l}
\hline
\textbf{min} & \textbf{max}\\
\hline
0 & Inf\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
## height  

Description for dataelement 'height'  

### Representation in **source** data system  

- Variable: height
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: height
- Variable type: integer  
    + n: 2154
    + Valid values: 2151
    + Missing values: 3
    + Distinct values: 52  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 168.22\\
\hline
Minimum & 144\\
\hline
Median & 168\\
\hline
Maximum & 198\\
\hline
SD & 9.25\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2151\\
\hline
OutLo & 0\\
\hline
OutHi & 1\\
\hline
Variance & 85.48\\
\hline
Range & 54\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r}
\hline
\textbf{min} & \textbf{max}\\
\hline
80 & 230\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
### Representation in **target** data system  

- Variable: height
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: height
- Variable type: integer  
    + n: 2154
    + Valid values: 2151
    + Missing values: 3
    + Distinct values: 52  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 168.22\\
\hline
Minimum & 144\\
\hline
Median & 168\\
\hline
Maximum & 198\\
\hline
SD & 9.25\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2151\\
\hline
OutLo & 0\\
\hline
OutHi & 1\\
\hline
Variance & 85.48\\
\hline
Range & 54\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r}
\hline
\textbf{min} & \textbf{max}\\
\hline
80 & 230\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
## id  

Description for dataelement 'id'  

### Representation in **source** data system  

- Variable: id
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: id
- Variable type: string  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 2154  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{id} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
3861 & 1 & 0.046\\
\hline
6506 & 1 & 0.046\\
\hline
6096 & 1 & 0.046\\
\hline
6674 & 1 & 0.046\\
\hline
6490 & 1 & 0.046\\
\hline
5366 & 1 & 0.046\\
\hline
5735 & 1 & 0.046\\
\hline
4031 & 1 & 0.046\\
\hline
3578 & 1 & 0.046\\
\hline
4807 & 1 & 0.046\\
\hline
5450 & 1 & 0.046\\
\hline
4763 & 1 & 0.046\\
\hline
4146 & 1 & 0.046\\
\hline
7096 & 1 & 0.046\\
\hline
3726 & 1 & 0.046\\
\hline
5459 & 1 & 0.046\\
\hline
5161 & 1 & 0.046\\
\hline
5562 & 1 & 0.046\\
\hline
4111 & 1 & 0.046\\
\hline
6392 & 1 & 0.046\\
\hline
5553 & 1 & 0.046\\
\hline
5404 & 1 & 0.046\\
\hline
3673 & 1 & 0.046\\
\hline
6808 & 1 & 0.046\\
\hline
5760 & 1 & 0.046\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: ' ^[[:digit:]]{1,5}$ '  
  
\newpage
### Representation in **target** data system  

- Variable: id
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: id
- Variable type: string  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 2154  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{id} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
3861 & 1 & 0.046\\
\hline
6506 & 1 & 0.046\\
\hline
6096 & 1 & 0.046\\
\hline
6674 & 1 & 0.046\\
\hline
6490 & 1 & 0.046\\
\hline
5366 & 1 & 0.046\\
\hline
5735 & 1 & 0.046\\
\hline
4031 & 1 & 0.046\\
\hline
3578 & 1 & 0.046\\
\hline
4807 & 1 & 0.046\\
\hline
5450 & 1 & 0.046\\
\hline
4763 & 1 & 0.046\\
\hline
4146 & 1 & 0.046\\
\hline
7096 & 1 & 0.046\\
\hline
3726 & 1 & 0.046\\
\hline
5459 & 1 & 0.046\\
\hline
5161 & 1 & 0.046\\
\hline
5562 & 1 & 0.046\\
\hline
4111 & 1 & 0.046\\
\hline
6392 & 1 & 0.046\\
\hline
5553 & 1 & 0.046\\
\hline
5404 & 1 & 0.046\\
\hline
3673 & 1 & 0.046\\
\hline
6808 & 1 & 0.046\\
\hline
5760 & 1 & 0.046\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: ' ^[[:digit:]]{1,5}$ '  
  
\newpage
## income  

Description for dataelement 'income': 

1 = < 2000; 2 = 2000 ï¿½ 4000; 3 = > 4000  

### Representation in **source** data system  

- Variable: income
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: income
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 5  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{income} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 992 & 46.054\\
\hline
1 & 602 & 27.948\\
\hline
3 & 444 & 20.613\\
\hline
99901 & 100 & 4.643\\
\hline
99900 & 16 & 0.743\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3 '
-  Levels that are not conform with the value set:  
99900  
99901  
  
\newpage
### Representation in **target** data system  

- Variable: income
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: income
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 5  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{income} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 992 & 46.054\\
\hline
1 & 602 & 27.948\\
\hline
3 & 444 & 20.613\\
\hline
99901 & 100 & 4.643\\
\hline
99900 & 16 & 0.743\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3 '
-  Levels that are not conform with the value set:  
99900  
99901  
  
\newpage
## ldl  

Description for dataelement 'ldl'  

### Representation in **source** data system  

- Variable: ldl
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: ldl
- Variable type: float  
    + n: 2154
    + Valid values: 2126
    + Missing values: 28
    + Distinct values: 2125  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 3.58\\
\hline
Minimum & 0.7\\
\hline
Median & 3.52\\
\hline
Maximum & 9.24\\
\hline
SD & 1.13\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2126\\
\hline
OutLo & 0\\
\hline
OutHi & 21\\
\hline
Variance & 1.28\\
\hline
Range & 8.54\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l}
\hline
\textbf{min} & \textbf{max}\\
\hline
0 & Inf\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
### Representation in **target** data system  

- Variable: ldl
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: ldl
- Variable type: float  
    + n: 2154
    + Valid values: 2126
    + Missing values: 28
    + Distinct values: 2125  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 3.58\\
\hline
Minimum & 0.7\\
\hline
Median & 3.52\\
\hline
Maximum & 9.24\\
\hline
SD & 1.13\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2126\\
\hline
OutLo & 0\\
\hline
OutHi & 21\\
\hline
Variance & 1.28\\
\hline
Range & 8.54\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l}
\hline
\textbf{min} & \textbf{max}\\
\hline
0 & Inf\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
## myocard  

Description for dataelement 'myocard': 

1 = yes; 2 = no  

### Representation in **source** data system  

- Variable: myocard
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: myocard
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 5  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{myocard} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 2015 & 93.547\\
\hline
1 & 65 & 3.018\\
\hline
99914 & 60 & 2.786\\
\hline
99901 & 7 & 0.325\\
\hline
99900 & 7 & 0.325\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2 '
-  Levels that are not conform with the value set:  
99900  
99901  
99914  
  
\newpage
### Representation in **target** data system  

- Variable: myocard
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: myocard
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 5  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{myocard} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 2015 & 93.547\\
\hline
1 & 65 & 3.018\\
\hline
99914 & 60 & 2.786\\
\hline
99901 & 7 & 0.325\\
\hline
99900 & 7 & 0.325\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2 '
-  Levels that are not conform with the value set:  
99900  
99901  
99914  
  
\newpage
## obs_bp  

Description for dataelement 'obs_bp': 

1 = Obs_01; 2 = Obs_02; 3 = Obs_03; 4 = Obs_04; 5 = Obs_05; 6 = Obs_06; 7 = Obs_07; 8 = Obs_08; 9 = Obs_09; 10 = Obs_10; 11 = Obs_11; 12 = Obs_12; 13 = Obs_13; 14 = Obs_14; 15 = Obs_15; 16 = Obs_16; 17 = Obs_17; 18 = Obs_18; 19 = Obs_19; 20 = Obs_20  

### Representation in **source** data system  

- Variable: obs_bp
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: obs_bp
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 11  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{obs\_bp} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
4 & 763 & 35.422\\
\hline
7 & 477 & 22.145\\
\hline
9 & 384 & 17.827\\
\hline
3 & 330 & 15.320\\
\hline
5 & 149 & 6.917\\
\hline
8 & 41 & 1.903\\
\hline
1 & 4 & 0.186\\
\hline
99902 & 3 & 0.139\\
\hline
11 & 1 & 0.046\\
\hline
18 & 1 & 0.046\\
\hline
16 & 1 & 0.046\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 '
-  Levels that are not conform with the value set:  
99902  
  
\newpage
### Representation in **target** data system  

- Variable: obs_bp
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: obs_bp
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 11  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{obs\_bp} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
4 & 763 & 35.422\\
\hline
7 & 477 & 22.145\\
\hline
9 & 384 & 17.827\\
\hline
3 & 330 & 15.320\\
\hline
5 & 149 & 6.917\\
\hline
8 & 41 & 1.903\\
\hline
1 & 4 & 0.186\\
\hline
99902 & 3 & 0.139\\
\hline
11 & 1 & 0.046\\
\hline
18 & 1 & 0.046\\
\hline
16 & 1 & 0.046\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 '
-  Levels that are not conform with the value set:  
99902  
  
\newpage
## obs_int  

Description for dataelement 'obs_int': 

1 = Obs_01; 2 = Obs_02; 3 = Obs_03; 4 = Obs_04; 5 = Obs_05; 6 = Obs_06; 7 = Obs_07; 8 = Obs_08; 9 = Obs_09; 10 = Obs_10; 11 = Obs_11; 12 = Obs_12; 13 = Obs_13; 14 = Obs_14; 15 = Obs_15; 16 = Obs_16; 17 = Obs_17; 18 = Obs_18; 19 = Obs_19; 20 = Obs_20 ; 21 = Obs_21; 22 = Obs_22; 23 = Obs_23; 24 = Obs_24; 25 = Obs_25  

### Representation in **source** data system  

- Variable: obs_int
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: obs_int
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 14  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{obs\_int} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 600 & 27.855\\
\hline
1 & 396 & 18.384\\
\hline
11 & 349 & 16.202\\
\hline
22 & 277 & 12.860\\
\hline
3 & 235 & 10.910\\
\hline
12 & 122 & 5.664\\
\hline
10 & 78 & 3.621\\
\hline
23 & 67 & 3.110\\
\hline
4 & 11 & 0.511\\
\hline
5 & 11 & 0.511\\
\hline
7 & 5 & 0.232\\
\hline
99900 & 1 & 0.046\\
\hline
25 & 1 & 0.046\\
\hline
13 & 1 & 0.046\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 '
-  Levels that are not conform with the value set:  
99900  
  
\newpage
### Representation in **target** data system  

- Variable: obs_int
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: obs_int
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 14  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{obs\_int} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 600 & 27.855\\
\hline
1 & 396 & 18.384\\
\hline
11 & 349 & 16.202\\
\hline
22 & 277 & 12.860\\
\hline
3 & 235 & 10.910\\
\hline
12 & 122 & 5.664\\
\hline
10 & 78 & 3.621\\
\hline
23 & 67 & 3.110\\
\hline
4 & 11 & 0.511\\
\hline
5 & 11 & 0.511\\
\hline
7 & 5 & 0.232\\
\hline
99900 & 1 & 0.046\\
\hline
25 & 1 & 0.046\\
\hline
13 & 1 & 0.046\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 '
-  Levels that are not conform with the value set:  
99900  
  
\newpage
## obs_soma  

Description for dataelement 'obs_soma': 

1 = Obs_01; 2 = Obs_02; 3 = Obs_03; 4 = Obs_04; 5 = Obs_05; 6 = Obs_06; 7 = Obs_07; 8 = Obs_08; 9 = Obs_09; 10 = Obs_10   

### Representation in **source** data system  

- Variable: obs_soma
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: obs_soma
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 9  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{obs\_soma} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
4 & 645 & 29.944\\
\hline
7 & 483 & 22.423\\
\hline
9 & 388 & 18.013\\
\hline
5 & 320 & 14.856\\
\hline
3 & 280 & 12.999\\
\hline
8 & 31 & 1.439\\
\hline
1 & 3 & 0.139\\
\hline
2 & 2 & 0.093\\
\hline
99902 & 2 & 0.093\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 '
-  Levels that are not conform with the value set:  
99902  
  
\newpage
### Representation in **target** data system  

- Variable: obs_soma
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: obs_soma
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 9  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{obs\_soma} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
4 & 645 & 29.944\\
\hline
7 & 483 & 22.423\\
\hline
9 & 388 & 18.013\\
\hline
5 & 320 & 14.856\\
\hline
3 & 280 & 12.999\\
\hline
8 & 31 & 1.439\\
\hline
1 & 3 & 0.139\\
\hline
2 & 2 & 0.093\\
\hline
99902 & 2 & 0.093\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 '
-  Levels that are not conform with the value set:  
99902  
  
\newpage
## sbp1  

Description for dataelement 'sbp1'  

### Representation in **source** data system  

- Variable: sbp1
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: sbp1
- Variable type: integer  
    + n: 2154
    + Valid values: 2152
    + Missing values: 2
    + Distinct values: 125  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 139.01\\
\hline
Minimum & 83\\
\hline
Median & 137\\
\hline
Maximum & 253\\
\hline
SD & 22.5\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2152\\
\hline
OutLo & 0\\
\hline
OutHi & 23\\
\hline
Variance & 506.09\\
\hline
Range & 170\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r}
\hline
\textbf{min} & \textbf{max}\\
\hline
80 & 200\\
\hline
\end{tabular}
\end{table}

-  Extrem values are not conform with constraints.  
  
\newpage
### Representation in **target** data system  

- Variable: sbp1
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: sbp1
- Variable type: integer  
    + n: 2154
    + Valid values: 2152
    + Missing values: 2
    + Distinct values: 125  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 139.01\\
\hline
Minimum & 83\\
\hline
Median & 137\\
\hline
Maximum & 253\\
\hline
SD & 22.5\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2152\\
\hline
OutLo & 0\\
\hline
OutHi & 23\\
\hline
Variance & 506.09\\
\hline
Range & 170\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r}
\hline
\textbf{min} & \textbf{max}\\
\hline
80 & 200\\
\hline
\end{tabular}
\end{table}

-  Extrem values are not conform with constraints.  
  
\newpage
## sbp2  

Description for dataelement 'sbp2'  

### Representation in **source** data system  

- Variable: sbp2
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: sbp2
- Variable type: integer  
    + n: 2154
    + Valid values: 2148
    + Missing values: 6
    + Distinct values: 123  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 136.4\\
\hline
Minimum & 83\\
\hline
Median & 134\\
\hline
Maximum & 258\\
\hline
SD & 21.86\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2148\\
\hline
OutLo & 0\\
\hline
OutHi & 24\\
\hline
Variance & 477.76\\
\hline
Range & 175\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r}
\hline
\textbf{min} & \textbf{max}\\
\hline
80 & 200\\
\hline
\end{tabular}
\end{table}

-  Extrem values are not conform with constraints.  
  
\newpage
### Representation in **target** data system  

- Variable: sbp2
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: sbp2
- Variable type: integer  
    + n: 2154
    + Valid values: 2148
    + Missing values: 6
    + Distinct values: 123  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 136.4\\
\hline
Minimum & 83\\
\hline
Median & 134\\
\hline
Maximum & 258\\
\hline
SD & 21.86\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2148\\
\hline
OutLo & 0\\
\hline
OutHi & 24\\
\hline
Variance & 477.76\\
\hline
Range & 175\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r}
\hline
\textbf{min} & \textbf{max}\\
\hline
80 & 200\\
\hline
\end{tabular}
\end{table}

-  Extrem values are not conform with constraints.  
  
\newpage
## school  

Description for dataelement 'school': 

0 = none; 1 = lower secondary; 2 = secondary; 3 = upper secondary  

### Representation in **source** data system  

- Variable: school
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: school
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 7  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{school} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 981 & 45.543\\
\hline
0 & 779 & 36.165\\
\hline
1 & 256 & 11.885\\
\hline
99914 & 60 & 2.786\\
\hline
99900 & 53 & 2.461\\
\hline
3 & 18 & 0.836\\
\hline
4 & 7 & 0.325\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 0, 1, 2, 3 '
-  Levels that are not conform with the value set:  
4  
99900  
99914  
  
\newpage
### Representation in **target** data system  

- Variable: school
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: school
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 7  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{school} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 981 & 45.543\\
\hline
0 & 779 & 36.165\\
\hline
1 & 256 & 11.885\\
\hline
99914 & 60 & 2.786\\
\hline
99900 & 53 & 2.461\\
\hline
3 & 18 & 0.836\\
\hline
4 & 7 & 0.325\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 0, 1, 2, 3 '
-  Levels that are not conform with the value set:  
4  
99900  
99914  
  
\newpage
## sex  

Description for dataelement 'sex': 

1 = males; 2 = females  

### Representation in **source** data system  

- Variable: sex
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: sex
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 2  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{sex} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 1167 & 54.178\\
\hline
1 & 987 & 45.822\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: ' 1, 2 '  
  
\newpage
### Representation in **target** data system  

- Variable: sex
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: sex
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 2  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{sex} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 1167 & 54.178\\
\hline
1 & 987 & 45.822\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: ' 1, 2 '  
  
\newpage
## smoking  

Description for dataelement 'smoking': 

0 = nonsmoker; 1 = former smoker; 2 = smoker  

### Representation in **source** data system  

- Variable: smoking
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: smoking
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 5  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{smoking} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
0 & 733 & 34.030\\
\hline
1 & 697 & 32.358\\
\hline
2 & 656 & 30.455\\
\hline
99914 & 60 & 2.786\\
\hline
99900 & 8 & 0.371\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 0, 1, 2 '
-  Levels that are not conform with the value set:  
99900  
99914  
  
\newpage
### Representation in **target** data system  

- Variable: smoking
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: smoking
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 5  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{smoking} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
0 & 733 & 34.030\\
\hline
1 & 697 & 32.358\\
\hline
2 & 656 & 30.455\\
\hline
99914 & 60 & 2.786\\
\hline
99900 & 8 & 0.371\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 0, 1, 2 '
-  Levels that are not conform with the value set:  
99900  
99914  
  
\newpage
## stroke  

Description for dataelement 'stroke': 

1 = yes; 2 = no  

### Representation in **source** data system  

- Variable: stroke
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: stroke
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 5  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{stroke} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 2028 & 94.150\\
\hline
99914 & 60 & 2.786\\
\hline
1 & 56 & 2.600\\
\hline
99900 & 7 & 0.325\\
\hline
99901 & 3 & 0.139\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2 '
-  Levels that are not conform with the value set:  
99900  
99901  
99914  
  
\newpage
### Representation in **target** data system  

- Variable: stroke
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: stroke
- Variable type: enumerated  
    + n: 2154
    + Valid values: 2154
    + Missing values: 0
    + Distinct values: 5  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{stroke} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 2028 & 94.150\\
\hline
99914 & 60 & 2.786\\
\hline
1 & 56 & 2.600\\
\hline
99900 & 7 & 0.325\\
\hline
99901 & 3 & 0.139\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1, 2 '
-  Levels that are not conform with the value set:  
99900  
99901  
99914  
  
\newpage
## waist  

Description for dataelement 'waist'  

### Representation in **source** data system  

- Variable: waist
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: waist
- Variable type: float  
    + n: 2154
    + Valid values: 2148
    + Missing values: 6
    + Distinct values: 2102  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 89.21\\
\hline
Minimum & 49.27\\
\hline
Median & 89.52\\
\hline
Maximum & 145.77\\
\hline
SD & 13.82\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2148\\
\hline
OutLo & 0\\
\hline
OutHi & 6\\
\hline
Variance & 191.09\\
\hline
Range & 96.5\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l}
\hline
\textbf{min} & \textbf{max}\\
\hline
30 & Inf\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
### Representation in **target** data system  

- Variable: waist
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: waist
- Variable type: float  
    + n: 2154
    + Valid values: 2148
    + Missing values: 6
    + Distinct values: 2102  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 89.21\\
\hline
Minimum & 49.27\\
\hline
Median & 89.52\\
\hline
Maximum & 145.77\\
\hline
SD & 13.82\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2148\\
\hline
OutLo & 0\\
\hline
OutHi & 6\\
\hline
Variance & 191.09\\
\hline
Range & 96.5\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l}
\hline
\textbf{min} & \textbf{max}\\
\hline
30 & Inf\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
## weight  

Description for dataelement 'weight'  

### Representation in **source** data system  

- Variable: weight
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: weight
- Variable type: float  
    + n: 2154
    + Valid values: 2150
    + Missing values: 4
    + Distinct values: 1763  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 77.63\\
\hline
Minimum & 42.6\\
\hline
Median & 77.04\\
\hline
Maximum & 144.44\\
\hline
SD & 15.08\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2150\\
\hline
OutLo & 0\\
\hline
OutHi & 17\\
\hline
Variance & 227.34\\
\hline
Range & 101.84\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r}
\hline
\textbf{min} & \textbf{max}\\
\hline
30 & 250\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
### Representation in **target** data system  

- Variable: weight
- Table: ship_data.csv  
  

 **Overview:**  

- Variable name: weight
- Variable type: float  
    + n: 2154
    + Valid values: 2150
    + Missing values: 4
    + Distinct values: 1763  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 77.63\\
\hline
Minimum & 42.6\\
\hline
Median & 77.04\\
\hline
Maximum & 144.44\\
\hline
SD & 15.08\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 2150\\
\hline
OutLo & 0\\
\hline
OutHi & 17\\
\hline
Variance & 227.34\\
\hline
Range & 101.84\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r}
\hline
\textbf{min} & \textbf{max}\\
\hline
30 & 250\\
\hline
\end{tabular}
\end{table}
  
  

\newpage

# Plausibility Checks

## Atemporal Plausibility 


### A_present_and_B_vv  

Contracept in males.  

#### Representation in source data system  

- Variable 1: sex
- Variable 2: contraception
- Filter criterion variable 2 (regex): ^1$
- Join criterion: id

 **Overview:**  

No data available for reporting  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{sex} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 572 & 97.945\\
\hline
1 & 12 & 2.055\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1 '
-  Levels that are not conform with the value set:  
2  
  

#### Representation in target data system  

- Variable 1: sex
- Variable 2: contraception
- Filter criterion variable 2 (regex): ^1$
- Join criterion: id

 **Overview:**  

No data available for reporting  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{sex} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
2 & 572 & 97.945\\
\hline
1 & 12 & 2.055\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1 '
-  Levels that are not conform with the value set:  
2  
  

### A_present_and_B_levels_vl  

Diab age but no diab.  

#### Representation in source data system  

- Variable 1: diab_known
- Variable 2: diab_age
- Filter criterion variable 2 (regex): ^(?!.*(99900|99901|99801)).*$
- Join criterion: id

 **Overview:**  

No data available for reporting  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{diab\_known} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
1 & 138 & 79.769\\
\hline
0 & 35 & 20.231\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1 '
-  Levels that are not conform with the value set:  
0  
  

#### Representation in target data system  

- Variable 1: diab_known
- Variable 2: diab_age
- Filter criterion variable 2 (regex): ^(?!.*(99900|99901|99801)).*$
- Join criterion: id

 **Overview:**  

No data available for reporting  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{diab\_known} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
1 & 138 & 79.769\\
\hline
0 & 35 & 20.231\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' 1 '
-  Levels that are not conform with the value set:  
0  
  

## Uniqueness Plausibility


### sex  

With each distinct value of 'id', only one value of 'sex' may be associated.  

#### Representation in source data system  

- Plausibility check: passed
- Message: No duplicate occurrences of id found in association with sex.

#### Representation in target data system  

- Plausibility check: passed
- Message: No duplicate occurrences of id found in association with sex.

\newpage

# Appendix

## R-Package Version 'DQAstats' 


```
## [1] '0.2.6.9003'
```

## R-Package Version 'DIZutils' 


```
## [1] '0.0.15.9002'
```

## R-Package Version 'DIZtools' 


```
## [1] '0.0.4'
```



```
## 
## ## SQL Statments
```


```
## 
## ### Source Data System
```

  


```
## 
## ### Target Data System
```
