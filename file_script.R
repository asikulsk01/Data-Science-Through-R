dir.create("FileHandlingNew")
setwd("./FileHandlingNew")
getwd()

filename=readline(prompt="Enter a .csv filename of your choice:") 
file.create(filename) 
cat("\n How many records to write? ") 
m=scan(n=1) 

vec=vector(mode="character",length=m) 
vec1=vector(mode="integer",length=m) 

for(i in 1:m){ 
	vec[i]=readline(prompt="Name?") 
	vec1[i]=as.integer(readline(prompt="Age?")) 
}

student_info=data.frame(name=vec,age=vec1)
student_info
write.csv(student_info,filename)
student_data=read.csv(filename)
print(student_data)