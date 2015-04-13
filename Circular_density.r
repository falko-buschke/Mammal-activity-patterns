#####################################################################################
#                                                                                   #
#   The following script is to calculate the activity patterns of mammals from      # 
#   camera trap data. It requires a data file with species identities as well       #
#   as the time at which they were recorded.                                        #
#   It fits a circular density to activity histograms following the method          #
#   outlined by:                                                                    #
#       Rowcliffe et al. (2014). Methods in Ecology and Evolution, 5, 1170-1179.    #
#                                                                                   #
#   Please be sure to read the README.txt file before implementing this script      #
#                                                                                   #
#   This script was last checked on 08 April 2015; if you come across any technical #
#   issues, please contact me at falko.buschke@gmail.com                            #
#                                                                                   #
#####################################################################################

#Begin by changing the working directory
setwd("ADD YOUR WORKING DIRECTORY HERE")

# Install the required packages
install.packages("activity") 
library(activity)

# Open the required data set (this includes species names and the times at which they were observed
# (Data was cleaned before importing to remove obsevrations recorded within 15 minutes of one another
mam <- read.table("Activity_data.txt", header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)

# Show how many observations there are for each species
table(mam$Species)

# This simply converts hours and minutes to decimal hours
times.24 <- mam$Hour + (mam$Minute/60)

# This converts the time (in decimal hours) into radians so that time is circular
time.rad <- (times.24*pi)/12

# This creates a vector of unique species names
Sp.id <- unique(mam$Species)

# This is an automated loop to creat a activity plot for each species
# The plots will be saved in your working directory

for (i in 1:length(Sp.id) {
  #Create a time vector for each species
  time.sp <- time.rad[which(mam$Species==Sp.id[i])]
  # This fits the circular density. If you want to plot the bootstapped confidence 
  # intervals, change the [sample = "none"] command to [sample = "data"]
  # Note that this takes much longer. Please use [?fitact] for more information
  test <- fitact(time.sp, wt = NULL, reps = 1000, bw = NULL, adj = 1, show = TRUE, sample="none")
  # This creates the activity plot with the species name as the title
  plot(test, hrs = TRUE, frq = TRUE, dat = "histogram", add = FALSE,main = Sp.id[i])
  # This saves the plot to the working directory
  savePlot(filename = Sp.id[i], type =  "emf",device = dev.cur(), restoreConsole = TRUE)
}
