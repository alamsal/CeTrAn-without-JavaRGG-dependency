
#g_speed_average=10



setwd(outputpath)
pdf("individual_tests.pdf")
for (i in c(1:nrow(id_table))) {
  plot.circle(traj[id(traj)==id_table$id[i]],env[[i]],g_traj_color1=TRUE)
  #plotindividtests(traj[id(traj)==id_table$id[i]],g_speed_average=10)
}
for (i in c(1:nrow(id_table))) {
  #plot.circle(traj[id(traj)==id_table$id[i]],env[[i]],g_traj_color1=TRUE)
  plotindividtests(traj[id(traj)==id_table$id[i]],g_speed_average=10)
}


dev.off()
setwd(rgghome)