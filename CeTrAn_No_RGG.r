rm(list=ls())

#Set main CeTrAn dir as rgghome
rgghome = "/Users/aashislamsal/Documents/Windows/CeTrAn/CeTrAn" 

#Set temp path inside
outputpath = paste(c(rgghome,"/temp"),collapse="")

setwd(rgghome)

outputfile = "m_output_"

#Change dirs as needed, however I do recommend to structure as in the provided sample
g_inputdir = "/Users/aashislamsal/Documents/Windows/CeTrAn/CeTrAn"

#Convert your group.txt file into csv file including the directory info...more details please see the csv
g_filetable = read.table("/Users/aashislamsal/Documents/Windows/CeTrAn/CeTrAn/DSimulans_Group.csv",header=F, sep=",")

#Convert csv file into a matrix because model requires the matrix
g_filetable = as.matrix(g_filetable)

g_outputdir = "model_results"

#Default values from model 
g_duration_slider = 10
g_bin_size = 1
g_treshold = 8

#More default values from model
g_supress_paints ="t"
g_open_pdf = "f"
g_general = "t"
g_roundarena = "t"
g_stripes_deviation = "t"
g_occupancy = "t"
g_angledev = "t"
g_outputtext = "t"
g_log = "t"
g_thigmo = "t"
g_pca = "t"
g_individual = "t"

# Set number of minutes speed cm/min

numberOfMinutes = 5

# load libs and functions
source("functions/include.r")

#check if input is ok
if (is.na(g_inputdir)||is.na(g_filetable))
	stop("No input files specified.")

if (ncol(g_filetable)!=2)
	stop("Input matrix has a wrong format")

# determine path
datapath = g_inputdir

# set output dir
outputpath = ""
if (!is.na(g_outputdir)) {
	outputpath = g_outputdir
} else {
	outputpath = paste(c(datapath,"/output/"),collapse="")	
}
#load fly data
fileName = g_filetable[,1]
group = g_filetable[,2]

# takes fileName, datapath and group
source("scripts/MultipleFilesLoader.r")
# "traj" contains the trajectories, "env[[i]]" the area informations
# "params[[i]]" the Experiment Parameters and Informations
# id_table the animals and corresponding groups

# print trajectorie information
#print(traj)

# get group and individum information
group_ids = levels(factor(group))

### compute and plot data


suppressWarnings(dir.create(outputpath))

setwd(outputpath)
message(paste(c("Writing output to ",outputpath),collapse=""))


# write to
bla = paste(c(outputfile,"t",g_treshold,"Pt",g_duration_slider,".pdf"),collapse="")
pdf(bla)


setwd(rgghome)
source ("scripts/samplesize.r")
if (g_general == "t") {
	source ("scripts/general.r")
	source ("scripts/straightness.r")
	
	
	source ("scripts/activity_martin.r")

	source ("scripts/activity_log.r")

	
}

if (g_roundarena == "t") {
source ("scripts/thigmotaxis.r")
}

if (g_stripes_deviation == "t"){
source ("scripts/angledev.r")

}

#
source ("scripts/pdfoutput.r")


if (g_occupancy == "t") {
	source ("scripts/occupancy.r")}

source ("scripts/saveworkspace.r")

if (g_pca== "t") {source ("scripts/pca.r")
	}

source ("scripts/saveworkspace2.r")


	
# close write
g = dev.off()

if (g_individual == "t") {
	source ("scripts/singleflyoutputs.r")}


# open pdf
plot_path = paste(c(getwd(),"/",bla),collapse="")
if (g_open_pdf =="t") {
	if (.Platform$OS.type=="Linux")
		system(paste(c("gnome-open",plot_path),collapse=" "))
	else
		system(paste(c("open",plot_path),collapse=" "))
}








