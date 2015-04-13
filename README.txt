________________________________________________
________________________________________________

This README file is made up of 4 components:

	1. Introduction
	2. Overview of data files
	3. Overview of R command scripts 

Author: Falko Buschke (falko.buschke@gmail.com)
23 January 2015
_______________________________________________
________________________________________________

1. Introduction

This archive contains the data and R scripts used for the following study:
	
Buschke, F.T.(unpublished). Nocturnal mammal community in the eastern Free State Province, South Africa, 10 years after abandoning livestock farming

A written description of the research methodology can be obtained from the manuscript.

Any comments or inquiries can be directed to the author, Falko Buschke (falko.buschke@gmail.com)

While the data and code have been thoroughly tested, I acknowledge that it is by no means perfect. The contents of these files were last verified on 8 April 2015.


______________________________________________


2. Overview of data files

This archive contains two data files.

The first (Activity_data.txt; 2.44 KB) is comprised of 169 rows and 3 columns. The rows containt he records of occurence for mammals species after cleaning the data to remove multiple observations within 15 minutes of one another. The columns are labelled to show their contents:

	- Hour: the hour of the observation
	- Minute: the miute of the observation
	- Species: The abbreviated species name

The second data file (Supplementary_table.pdf; 12.1 KB) contains species lists for mammals in the Golden Gate Highlands National Park and for this study for comparison purposes. 
______________________________________________


3. Overview of R command scripts 

One file (Circular_density.r) contains the command script in the R programming language to reproduce the panels used in Figure 1 of the manuscript. The command script is fully annotated and should be understandable to anyone with basic experience using R.

The script is fully uthomated and should run as is to save figures in the defiend workign directory. The only considerations are that (1) the user defines their own working directory in Line 18 and that they have a working internet connection to install the required package (assuming it is not already installed on the users local machine).

The script contains the functions used to fit a circular density function to time-frequency data according to the method by:

	Rowcliffe, J.M., Kys, R., Kranstauber, B., Carbone, C. And Jansen, P.A. (2014) Quantifying levels of animal activity using camera trap data. Methods in Ecology and Evolution, 5, 1170-1179.

It calls the 'activity' package from the CRAN repository:

	Rowcliffe, M. (2014) activity: Animal Activity Statistics. R Package version 1.0. http://CRAN.R-project.org/package=activity



-----------------------------------------------------------------------------------
