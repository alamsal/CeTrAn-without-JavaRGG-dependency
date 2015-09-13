# takes g_inputdir,g_filetable and g_outputdir
##and g_supress_paints
# return general plots, speed walks,..


### R CODE ###
##############
group_ids = levels(factor(group))
message("starting general.r")

### speed boxplot	
average_speeds = c()

#compute speeds for each individum
for (i in c(1:nrow(id_table))) {
	speeds = c.speeds(traj[id(traj)==id_table$id[i]])$speed_det
	speeds = speeds[speeds>0]
	speeds = speeds[!speeds>50]
#   hist (speeds, breaks=50)
	average_speeds = c(average_speeds,median(speeds,na.rm=TRUE))
}

#changes for Stefani
myList = list()
for(i in 1: numberOfMinutes){
	myList[[i]] = i*60*average_speeds/100
}

speedMatrix = do.call(cbind,myList)

colnames(speedMatrix) = c(paste("speed_cm_p_min",1:numberOfMinutes))

#end changes for Stefani
speed_table = data.frame(speeds=average_speeds,group=id_table$group)

#speed_mtable = create.mean.table(speed_table,group_ids)

#mybarplot(speed_mtable$means$speeds,speed_mtable$ses$speeds, rownames = group_ids,
#	main="Speed plot",ylab="Average walking speed [mm/s]", ylim = c(0,ylim_speed))

	
### distance boxplot
#compute distance for each individum
distances = c()
for (i in c(1:nrow(id_table))) {
	dist = c.distance(traj[id(traj)==id_table$id[i]])
	distances = c(distances,dist)
}
#dist_table = data.frame(dist=distances,group=id_table$group)
#dist_mtable = create.mean.table(dist_table,group_ids)



# mybarplot(dist_mtable$means$dist,dist_mtable$ses$dist, rownames = group_ids,
	# main="Walking distance plot",ylab="Total walking distance [mm]", ylim = c(0,ylim_walkdist))



### number of walks between stripes
#compute walks for each individum
walks = c()
for (i in c(1:nrow(id_table))) {
	walks = c(walks,nrow(c.nwalks(traj[id(traj)==id_table$id[i]],env[[i]])))
}
f_table = data.frame(f_table,speed_mm_p_s=average_speeds,speedMatrix,distance_traveled_p_min=distances, number_of_walks=walks)

f_table_positive= data.frame(f_table_positive,speed_mm_p_s=average_speeds,speedMatrix,distance_traveled_p_min=distances, number_of_walks=walks)

#walk_table = data.frame(walks,group=id_table$group)
#walk_mtable = create.mean.table(walk_table,group_ids)
# mybarplot(walk_mtable$means$walks,walk_mtable$ses$walks,rownames = group_ids,
	# main="Walks between stripes",ylab="Number of walks", ylim = c(0,ylim_walks))





#setwd(rgghome)



