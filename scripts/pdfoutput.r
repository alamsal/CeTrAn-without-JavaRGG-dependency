#pdf("test.pdf")
message("writeoutput_positive")
save.image(file= paste(outputfile,"_datainputbeforewrite.rdata"))

for (i in c(3: ncol(f_table_positive))){
  thisdatatable= data.frame(values=f_table_positive[,i], group=f_table_positive[,2])
	thisdataname = names(f_table_positive)[i]
	meanstable = create.mean.table(thisdatatable,group_ids)
	ymax = max(meanstable$means$values)+1.2*max(meanstable$ses$values)
	ymin = min(0,min(meanstable$means$values)-1.2*max(meanstable$ses$values))
	ymin=ifelse(is.na(ymin),0,ymin)
	ymax=ifelse(is.na(ymax),0,ymax)
	mybarplot(meanstable$means$values,meanstable$ses$values,rownames = group_ids,main=paste("mean of ", thisdataname),ylab=thisdataname,ylim= c(ymin,ymax))
}
message("writeoutput index")
for (i in c(3,4)){
	thisdatatable= data.frame(values=f_table_index[,i], group=f_table_index[,2])
	thisdataname = names(f_table_index)[i]
	meanstable = create.mean.table(thisdatatable,group_ids)
	ymax = 1
	ymin = -1
	mybarplot(meanstable$means$values,meanstable$ses$values,rownames = group_ids,main=paste("mean of ", thisdataname),ylab=thisdataname,ylim= c(ymin,ymax))
}

##plot stripe deviation
i=5
thisdatatable= data.frame(values=f_table_index[,i], group=f_table_index[,2])
	thisdataname = names(f_table_index)[i]
	meanstable = create.mean.table(thisdatatable,group_ids)
	ymax = 50
	ymin = 0
	mybarplot(meanstable$means$values,meanstable$ses$values,rownames = group_ids,main=paste("mean of ", thisdataname),ylab="stripe deviation [degrees]",ylim= c(ymin,ymax))
	abline(h=45, col=2)


###




#dev.off()
	
	
	
