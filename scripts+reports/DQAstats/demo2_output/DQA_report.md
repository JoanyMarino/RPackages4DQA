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


title: "Data Quality Report: Comparison of exampleCSV_source and exampleCSV_target"
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

\begin{table}[H]
\centering
\begin{tabular}{l|l|l|l|l}
\hline
\textbf{Variable} & \textbf{\# n} & \textbf{\# Valid} & \textbf{\# Missing} & \textbf{\# Distinct}\\
\hline
Person ID & 23 & 23 & 0 & 16\\
\hline
Credit worthy? & 23 & 23 & 0 & 2\\
\hline
\end{tabular}
\end{table}

## Source Data System

\begin{table}[H]
\centering
\begin{tabular}{l|l|l|l|l}
\hline
\textbf{Variable} & \textbf{\# n} & \textbf{\# Valid} & \textbf{\# Missing} & \textbf{\# Distinct}\\
\hline
Person ID & 23 & 23 & 0 & 16\\
\hline
Credit worthy? & 23 & 23 & 0 & 2\\
\hline
\end{tabular}
\end{table}

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
Age in years & NA & NA & NA\\
\hline
Amount of credit & passed & passed & passed\\
\hline
Birthdate & passed & passed & passed\\
\hline
Credit worthy? & passed & passed & passed\\
\hline
Current bank balance & passed & passed & passed\\
\hline
Date of contact & passed & passed & passed\\
\hline
Forename & passed & passed & passed\\
\hline
Income & passed & passed & passed\\
\hline
Job & NA & NA & NA\\
\hline
Name & passed & passed & passed\\
\hline
Person ID & passed & passed & passed\\
\hline
Sex & failed & passed & passed\\
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
Age in years & NA & NA\\
\hline
Amount of credit & 56.52 & 56.52\\
\hline
Birthdate & 0 & 0\\
\hline
Credit worthy? & 0 & 0\\
\hline
Current bank balance & 0 & 0\\
\hline
Date of contact & 0 & 0\\
\hline
Forename & 0 & 0\\
\hline
Income & 0 & 0\\
\hline
Job & 0 & NA\\
\hline
Name & 0 & 0\\
\hline
Person ID & 0 & 0\\
\hline
Sex & 0 & 0\\
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
Age in years & failed & failed\\
\hline
Amount of credit & passed & passed\\
\hline
Birthdate & passed & passed\\
\hline
Credit worthy? & passed & passed\\
\hline
Current bank balance & failed & failed\\
\hline
Date of contact & passed & passed\\
\hline
Income & passed & failed\\
\hline
Sex & passed & failed\\
\hline
pl.atemporal.item01 & passed & failed\\
\hline
\end{tabular}
\end{table}


\newpage

# Detailed Descriptive Analysis


## Age in years  

The age of the person at the time of contact.  

### Representation in **source** data system  

- Variable: AGE
- Table: dqa_example_data_01.csv  
  

 **Overview:**  

No data available for reporting  
  

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r|l}
\hline
\textbf{min} & \textbf{max} & \textbf{unit}\\
\hline
0 & 110 & a\\
\hline
\end{tabular}
\end{table}

-  No data available to perform conformance checks.  
  
\newpage
### Representation in **target** data system  

- Variable: AGE
- Table: dqa_example_data_02.csv  
  

 **Overview:**  

- Variable name: dqa_age_years
- Variable type: integer  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 21  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 67.35\\
\hline
Minimum & 22\\
\hline
Median & 64\\
\hline
Maximum & 175\\
\hline
SD & 32.45\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 23\\
\hline
OutLo & 0\\
\hline
OutHi & 1\\
\hline
Variance & 1052.87\\
\hline
Range & 153\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|r|l}
\hline
\textbf{min} & \textbf{max} & \textbf{unit}\\
\hline
0 & 110 & a\\
\hline
\end{tabular}
\end{table}

-  Extrem values are not conform with constraints.  
  
\newpage
## Amount of credit  

That's the amount of credit the person has used  

### Representation in **source** data system  

- Variable: CREDIT-AMOUNT
- Table: dqa_example_data_01.csv  
  

 **Overview:**  

- Variable name: dqa_credit_amount
- Variable type: integer  
    + n: 23
    + Valid values: 10
    + Missing values: 13
    + Distinct values: 10  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 39220\\
\hline
Minimum & 12200\\
\hline
Median & 33350\\
\hline
Maximum & 72800\\
\hline
SD & 21447.19\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 10\\
\hline
OutLo & 0\\
\hline
OutHi & 0\\
\hline
Variance & 459981777.78\\
\hline
Range & 60600\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l|l}
\hline
\textbf{min} & \textbf{max} & \textbf{unit}\\
\hline
0 & Inf & money\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
### Representation in **target** data system  

- Variable: CREDIT-AMOUNT
- Table: dqa_example_data_02.csv  
  

 **Overview:**  

- Variable name: dqa_credit_amount
- Variable type: integer  
    + n: 23
    + Valid values: 10
    + Missing values: 13
    + Distinct values: 10  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 39220\\
\hline
Minimum & 12200\\
\hline
Median & 33350\\
\hline
Maximum & 72800\\
\hline
SD & 21447.19\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 10\\
\hline
OutLo & 0\\
\hline
OutHi & 0\\
\hline
Variance & 459981777.78\\
\hline
Range & 60600\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l|l}
\hline
\textbf{min} & \textbf{max} & \textbf{unit}\\
\hline
0 & Inf & money\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
## Birthdate  

The date of birth written as dd.mm.yyyy  

### Representation in **source** data system  

- Variable: BIRTHDATE
- Table: dqa_example_data_01.csv  
  

 **Overview:**  

- Variable name: dqa_birthdate
- Variable type: datetime  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 16  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Min. & 1921-02-19\\
\hline
1st Qu. & 1932-09-17\\
\hline
Median & 1951-07-03\\
\hline
Mean & 1950-09-25\\
\hline
3rd Qu. & 1965-05-10\\
\hline
Max. & 1990-05-26\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: ''  
  
\newpage
### Representation in **target** data system  

- Variable: BIRTHDATE
- Table: dqa_example_data_02.csv  
  

 **Overview:**  

- Variable name: dqa_birthdate
- Variable type: datetime  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 16  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Min. & 1921-02-19\\
\hline
1st Qu. & 1932-09-17\\
\hline
Median & 1951-07-03\\
\hline
Mean & 1950-09-25\\
\hline
3rd Qu. & 1965-05-10\\
\hline
Max. & 1990-05-26\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: ''  
  
\newpage
## Credit worthy?  

Indicates whether the person is creditworthy at the time of the contact  

### Representation in **source** data system  

- Variable: CREDIT-WORTHY
- Table: dqa_example_data_01.csv  
  

 **Overview:**  

- Variable name: dqa_credit_worthy
- Variable type: enumerated  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 2  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_credit\_worthy} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
no & 13 & 56.522\\
\hline
yes & 10 & 43.478\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: ' yes, no '  
  
\newpage
### Representation in **target** data system  

- Variable: CREDIT-WORTHY
- Table: dqa_example_data_02.csv  
  

 **Overview:**  

- Variable name: dqa_credit_worthy
- Variable type: enumerated  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 2  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_credit\_worthy} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
no & 13 & 56.522\\
\hline
yes & 10 & 43.478\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: ' yes, no '  
  
\newpage
## Current bank balance  

The bank-balance at the time of contact  

### Representation in **source** data system  

- Variable: BANK-BALANCE
- Table: dqa_example_data_01.csv  
  

 **Overview:**  

- Variable name: dqa_bank_balance
- Variable type: integer  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 22  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 35152.17\\
\hline
Minimum & -34200\\
\hline
Median & 18800\\
\hline
Maximum & 124100\\
\hline
SD & 39516.63\\
\hline
Negativ & 2\\
\hline
Zero & 0\\
\hline
Positive & 21\\
\hline
OutLo & 0\\
\hline
OutHi & 0\\
\hline
Variance & 1561564426.88\\
\hline
Range & 158300\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{l|l|l}
\hline
\textbf{min} & \textbf{max} & \textbf{unit}\\
\hline
-Inf & Inf & money\\
\hline
\end{tabular}
\end{table}

-  Extrem values are not conform with constraints.  
  
\newpage
### Representation in **target** data system  

- Variable: BANK-BALANCE
- Table: dqa_example_data_02.csv  
  

 **Overview:**  

- Variable name: dqa_bank_balance
- Variable type: integer  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 22  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 26395.65\\
\hline
Minimum & -64200\\
\hline
Median & 12800\\
\hline
Maximum & 124100\\
\hline
SD & 46097.8\\
\hline
Negativ & 4\\
\hline
Zero & 0\\
\hline
Positive & 19\\
\hline
OutLo & 0\\
\hline
OutHi & 0\\
\hline
Variance & 2125006798.42\\
\hline
Range & 188300\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{l|l|l}
\hline
\textbf{min} & \textbf{max} & \textbf{unit}\\
\hline
-Inf & Inf & money\\
\hline
\end{tabular}
\end{table}

-  Extrem values are not conform with constraints.  
  
\newpage
## Date of contact  

Date of contact  

### Representation in **source** data system  

- Variable: CONTACT-DATE
- Table: dqa_example_data_01.csv  
  

 **Overview:**  

- Variable name: dqa_contact_date
- Variable type: datetime  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 23  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Min. & 2011-10-12\\
\hline
1st Qu. & 2012-08-11\\
\hline
Median & 2013-10-02\\
\hline
Mean & 2013-10-28\\
\hline
3rd Qu. & 2014-12-21\\
\hline
Max. & 2015-12-20\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: ''  
  
\newpage
### Representation in **target** data system  

- Variable: CONTACT-DATE
- Table: dqa_example_data_02.csv  
  

 **Overview:**  

- Variable name: dqa_contact_date
- Variable type: datetime  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 23  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Min. & 2011-10-12\\
\hline
1st Qu. & 2012-08-11\\
\hline
Median & 2013-10-02\\
\hline
Mean & 2013-10-28\\
\hline
3rd Qu. & 2014-12-21\\
\hline
Max. & 2015-12-20\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: ''  
  
\newpage
## Forename  

The Forename of the person.  

### Representation in **source** data system  

- Variable: FORENAME
- Table: dqa_example_data_01.csv  
  

 **Overview:**  

- Variable name: dqa_forename
- Variable type: string  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 16  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_forename} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
Geraldine & 3 & 13.043\\
\hline
Zenaida & 3 & 13.043\\
\hline
Williams & 2 & 8.696\\
\hline
Wayne & 2 & 8.696\\
\hline
Dorothy & 2 & 8.696\\
\hline
Lawrence & 1 & 4.348\\
\hline
Janet & 1 & 4.348\\
\hline
Martin & 1 & 4.348\\
\hline
Georgina & 1 & 4.348\\
\hline
Elliott & 1 & 4.348\\
\hline
Gilberto & 1 & 4.348\\
\hline
Annie & 1 & 4.348\\
\hline
Karen & 1 & 4.348\\
\hline
John & 1 & 4.348\\
\hline
Susan & 1 & 4.348\\
\hline
Elijah & 1 & 4.348\\
\hline
\end{tabular}
\end{table}
\newpage
### Representation in **target** data system  

- Variable: FORENAME
- Table: dqa_example_data_02.csv  
  

 **Overview:**  

- Variable name: dqa_forename
- Variable type: string  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 16  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_forename} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
Geraldine & 3 & 13.043\\
\hline
Zenaida & 3 & 13.043\\
\hline
Williams & 2 & 8.696\\
\hline
Wayne & 2 & 8.696\\
\hline
Dorothy & 2 & 8.696\\
\hline
Lawrence & 1 & 4.348\\
\hline
Janet & 1 & 4.348\\
\hline
Martin & 1 & 4.348\\
\hline
Georgina & 1 & 4.348\\
\hline
Elliott & 1 & 4.348\\
\hline
Gilberto & 1 & 4.348\\
\hline
Annie & 1 & 4.348\\
\hline
Karen & 1 & 4.348\\
\hline
John & 1 & 4.348\\
\hline
Susan & 1 & 4.348\\
\hline
Elijah & 1 & 4.348\\
\hline
\end{tabular}
\end{table}
\newpage
## Income  

The income of the person at the time of contact  

### Representation in **source** data system  

- Variable: INCOME
- Table: dqa_example_data_01.csv  
  

 **Overview:**  

- Variable name: dqa_income
- Variable type: integer  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 23  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 68826.09\\
\hline
Minimum & 3000\\
\hline
Median & 59000\\
\hline
Maximum & 145000\\
\hline
SD & 46841.76\\
\hline
Negativ & 0\\
\hline
Zero & 0\\
\hline
Positive & 23\\
\hline
OutLo & 0\\
\hline
OutHi & 0\\
\hline
Variance & 2194150197.63\\
\hline
Range & 142000\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l|l}
\hline
\textbf{min} & \textbf{max} & \textbf{unit}\\
\hline
0 & Inf & money\\
\hline
\end{tabular}
\end{table}
  
  
\newpage
### Representation in **target** data system  

- Variable: INCOME
- Table: dqa_example_data_02.csv  
  

 **Overview:**  

- Variable name: dqa_income
- Variable type: integer  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 23  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|l}
\hline
Mean & 68391.3\\
\hline
Minimum & -5000\\
\hline
Median & 59000\\
\hline
Maximum & 145000\\
\hline
SD & 47502.86\\
\hline
Negativ & 1\\
\hline
Zero & 0\\
\hline
Positive & 22\\
\hline
OutLo & 0\\
\hline
OutHi & 0\\
\hline
Variance & 2256521739.13\\
\hline
Range & 150000\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules:\begin{table}[H]
\centering
\begin{tabular}{r|l|l}
\hline
\textbf{min} & \textbf{max} & \textbf{unit}\\
\hline
0 & Inf & money\\
\hline
\end{tabular}
\end{table}

-  Extrem values are not conform with constraints.  
  
\newpage
## Job  

The job of the person at the time of contact  

### Representation in **source** data system  

- Variable: JOB
- Table: dqa_example_data_01.csv  
  

 **Overview:**  

- Variable name: dqa_job
- Variable type: string  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 15  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_job} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
Bank manager & 3 & 13.043\\
\hline
Magician & 3 & 13.043\\
\hline
Student & 2 & 8.696\\
\hline
Pilot & 2 & 8.696\\
\hline
Lawyer & 2 & 8.696\\
\hline
Singer & 2 & 8.696\\
\hline
Photographer & 1 & 4.348\\
\hline
Farmer & 1 & 4.348\\
\hline
Professor & 1 & 4.348\\
\hline
Engineer & 1 & 4.348\\
\hline
Researcher & 1 & 4.348\\
\hline
Chemist & 1 & 4.348\\
\hline
Gardener & 1 & 4.348\\
\hline
Psychologist & 1 & 4.348\\
\hline
Comedian & 1 & 4.348\\
\hline
\end{tabular}
\end{table}
\newpage
### Representation in **target** data system  

- Variable: JOB
- Table: dqa_example_data_02.csv  
  

 **Overview:**  

No data available for reporting  
  
\newpage
## Name  

The Surname of the person.  

### Representation in **source** data system  

- Variable: NAME
- Table: dqa_example_data_01.csv  
  

 **Overview:**  

- Variable name: dqa_name
- Variable type: string  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 16  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_name} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
Jackson & 3 & 13.043\\
\hline
Staggs & 3 & 13.043\\
\hline
Rodriguez & 2 & 8.696\\
\hline
Burdett & 2 & 8.696\\
\hline
Simpson & 2 & 8.696\\
\hline
Daniels & 1 & 4.348\\
\hline
Dardar & 1 & 4.348\\
\hline
Jones & 1 & 4.348\\
\hline
Cook & 1 & 4.348\\
\hline
Eatmon & 1 & 4.348\\
\hline
Kenney & 1 & 4.348\\
\hline
Stock & 1 & 4.348\\
\hline
Shuck & 1 & 4.348\\
\hline
Malloy & 1 & 4.348\\
\hline
Kirkland & 1 & 4.348\\
\hline
Sutton & 1 & 4.348\\
\hline
\end{tabular}
\end{table}
\newpage
### Representation in **target** data system  

- Variable: NAME
- Table: dqa_example_data_02.csv  
  

 **Overview:**  

- Variable name: dqa_name
- Variable type: string  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 16  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_name} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
Jackson & 3 & 13.043\\
\hline
Staggs & 3 & 13.043\\
\hline
Rodriguez & 2 & 8.696\\
\hline
Burdett & 2 & 8.696\\
\hline
Simpson & 2 & 8.696\\
\hline
Daniels & 1 & 4.348\\
\hline
Dardar & 1 & 4.348\\
\hline
Jones & 1 & 4.348\\
\hline
Cook & 1 & 4.348\\
\hline
Eatmon & 1 & 4.348\\
\hline
Kenney & 1 & 4.348\\
\hline
Stock & 1 & 4.348\\
\hline
Shuck & 1 & 4.348\\
\hline
Malloy & 1 & 4.348\\
\hline
Kirkland & 1 & 4.348\\
\hline
Sutton & 1 & 4.348\\
\hline
\end{tabular}
\end{table}
\newpage
## Person ID  

Each person has its own person-id. It stays the same over the whole live of the person and does not change.  

### Representation in **source** data system  

- Variable: PERSON_ID
- Table: dqa_example_data_01.csv  
  

 **Overview:**  

- Variable name: dqa_person_id
- Variable type: string  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 16  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_person\_id} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
1 & 3 & 13.043\\
\hline
7 & 3 & 13.043\\
\hline
5 & 2 & 8.696\\
\hline
11 & 2 & 8.696\\
\hline
15 & 2 & 8.696\\
\hline
2 & 1 & 4.348\\
\hline
3 & 1 & 4.348\\
\hline
4 & 1 & 4.348\\
\hline
6 & 1 & 4.348\\
\hline
8 & 1 & 4.348\\
\hline
9 & 1 & 4.348\\
\hline
10 & 1 & 4.348\\
\hline
12 & 1 & 4.348\\
\hline
13 & 1 & 4.348\\
\hline
14 & 1 & 4.348\\
\hline
16 & 1 & 4.348\\
\hline
\end{tabular}
\end{table}
\newpage
### Representation in **target** data system  

- Variable: PERSON_ID
- Table: dqa_example_data_02.csv  
  

 **Overview:**  

- Variable name: dqa_person_id
- Variable type: string  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 16  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_person\_id} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
1 & 3 & 13.043\\
\hline
7 & 3 & 13.043\\
\hline
5 & 2 & 8.696\\
\hline
11 & 2 & 8.696\\
\hline
15 & 2 & 8.696\\
\hline
2 & 1 & 4.348\\
\hline
3 & 1 & 4.348\\
\hline
4 & 1 & 4.348\\
\hline
6 & 1 & 4.348\\
\hline
8 & 1 & 4.348\\
\hline
9 & 1 & 4.348\\
\hline
10 & 1 & 4.348\\
\hline
12 & 1 & 4.348\\
\hline
13 & 1 & 4.348\\
\hline
14 & 1 & 4.348\\
\hline
16 & 1 & 4.348\\
\hline
\end{tabular}
\end{table}
\newpage
## Sex  

The sex of the person in one letter: m, f or x for unknown.  

### Representation in **source** data system  

- Variable: SEX
- Table: dqa_example_data_01.csv  
  

 **Overview:**  

- Variable name: dqa_sex
- Variable type: enumerated  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 2  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_sex} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
f & 13 & 56.522\\
\hline
m & 10 & 43.478\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: ' m, f, x '  
  
\newpage
### Representation in **target** data system  

- Variable: SEX
- Table: dqa_example_data_02.csv  
  

 **Overview:**  

- Variable name: dqa_sex
- Variable type: enumerated  
    + n: 23
    + Valid values: 23
    + Missing values: 0
    + Distinct values: 3  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_sex} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
f & 12 & 52.174\\
\hline
m & 10 & 43.478\\
\hline
abc & 1 & 4.348\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' male, female, unknown '
-  Levels that are not conform with the value set:  
abc  
f  
m  
  

\newpage

# Plausibility Checks

## Atemporal Plausibility 


### Pl.atemporal.Item01  

Persons with a negative bank balance cannot be credit worthy  

#### Representation in source data system  

- Variable 1: dqa_credit_worthy
- Variable 2: dqa_bank_balance
- Filter criterion variable 2 (regex): ^(-)
- Join criterion: dqa_person_id

 **Overview:**  

No data available for reporting  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_credit\_worthy} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
no & 2 & 100\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: passed
- Constraining values/rules: ' no '  
  

#### Representation in target data system  

- Variable 1: dqa_credit_worthy
- Variable 2: dqa_bank_balance
- Filter criterion variable 2 (regex): ^(-)
- Join criterion: dqa_person_id

 **Overview:**  

No data available for reporting  
  

 **Results:**  
\begin{table}[H]
\centering
\begin{tabular}{l|r|r}
\hline
\textbf{dqa\_credit\_worthy} & \textbf{Freq} & \textbf{\% Valid}\\
\hline
no & 2 & 50\\
\hline
yes & 2 & 50\\
\hline
\end{tabular}
\end{table}

 **Value conformance:**  

- Conformance check: failed
- Constraining values/rules: ' no '
-  Levels that are not conform with the value set:  
yes  
  

## Uniqueness Plausibility


### dqa_name  

The last name of a person must be identical in all entries for one person ID.  

#### Representation in source data system  

- Plausibility check: passed
- Message: No duplicate occurrences of dqa_person_id found in association with dqa_name.

#### Representation in target data system  

- Plausibility check: passed
- Message: No duplicate occurrences of dqa_person_id found in association with dqa_name.

\newpage

# Appendix

## R-Package Version 'DQAstats' 


```
## [1] '0.2.4'
```

## R-Package Version 'DIZutils' 


```
## [1] '0.0.13'
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
