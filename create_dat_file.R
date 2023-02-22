getwd()
cat("How many columns will there be in your data frame?") 
c=scan(n=1) 
df=data.frame()

# Creating a blank structure of a data frame 
col=vector("character",c)
lb=vector("character",c)

# Declaring space for the column labels and the data 
for(i in 1:c)
{ 
	print(paste("Enter data for column No.",i)) 
	lb[i]=readline(prompt="Enter the column Name: ") 
	col[i]=readline(prompt="column Data?")
}

# The data is to be entered as a vector such as c(…) source
names(col)=lb
print(col)
 
# This is to attach the column label 
df=rbind(df,col)
# This is to insert the column in the data frame. 
write.table(df,"Employee.dat",sep="\t")

# This is to write the data frame in a file in tab separated columns 
d=read.table("Employee.dat",sep="\t", header=TRUE)

# This is to contents of the file in d
print(d)