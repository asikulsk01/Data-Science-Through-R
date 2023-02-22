library(RJDBC)
driver_oracle = JDBC("oracle.jdbc.driver.OracleDriver","C:\\oraclexe\\app\\oracle\\product\\10.2.0\\server\\jdbc\\lib\\ojdbc14.jar")
conn_db = dbConnect(driver_oracle,"jdbc:oracle:thin:@127.0.0.1:1521:XE","hr","hr")
employee_data <- dbGetQuery(conn_db,"SELECT * FROM EMP")
print(employee_data)
employee_data <- dbGetQuery(conn_db,"SELECT * FROM EMP WHERE EMP_ID IN('E001','E002')")
print(employee_data)
employee_data <- dbGetQuery(conn_db,"SELECT EMP_ID,EMP_NAME,EMP_CONTACT,EMP_ADDRESS FROM EMP WHERE EMP_ID BETWEEN 'E001' AND 'E003'")
print(employee_data)
employee_data1 <- dbReadTable(conn_db,"EMP")
print(employee_data1)
#This is use to disconnect from server.
dbDisconnect(conn_db)

student_info_df <- data.frame(STUDENT_ID=c(101,102,103,104),STUDENT_FNAME=c("Asikul","Biswajit","Soumen","Soumi"),STUDENT_MNAME=c("","","Kumar",""),STUDENT_LNAME=c("Seikh","Mondal","Banerjee","Chakraborty"),STUDENT_AGE=c(21,22,23,24),STUDENT_GENDER=c("M","M","M","F"),STUDENT_EMAIL=c("asikulsk@gmail.com","biswajitbm@gmail.com","Soumen.tiu@outlook.com","soumi.c@gmail.com"),STUDENT_CONTACTNO=c(9614478457,9876540987,8765098231,9800154327),STUDENT_DEPT=c("CA","CA","CSE","CA"),STUDENT_COURSE=c("BCA(H)","BCA(H)","B.TECH","IMCA"))
print(student_info_df)
table_value <- dbWriteTable(conn=conn_db,name='Student_info',value=student_info_df,row.names=FALSE,field.types=c(STUDENT_ID="integer(10)",STUDENT_FNAME="varchar2(30)",STUDENT_MNAME="varchar2(20)",STUDENT_LNAME="varchar2(20)",STUDENT_AGE="integer(3)",STUDENT_GENDER="varchar2(2)",STUDENT_EMAIL="varchar2(40)",STUDENT_CONTACTNO="integer(10)",STUDENT_DEPT="varchar2(10)",STUDENT_COURSE="varchar2(20)"),overwrite=TRUE)
if(table_value==TRUE){
	print("The dataframe values are copied within the table under XE schema.")
}else{
	print("The dataframe values are not copied.")
}

student_info_df1 <- data.frame(STUDENT_ID=c(105,106,107,108),STUDENT_FNAME=c("Rahul","Shiv","Atul","Prajal"),STUDENT_MNAME=c("","Ratan","","Kumar"),STUDENT_LNAME=c("Yadav","Mondal","Singh","Mishra"),STUDENT_AGE=c(23,24,25,22),STUDENT_GENDER=c("M","M","M","M"),STUDENT_EMAIL=c("rahul.rr1@gmail.com","shiv.43@gmail.com","singh.atul@hotmail.com","p.mishra@gmail.com"),STUDENT_CONTACTNO=c(7890050281,9876541037,8765096102,9800156619),STUDENT_DEPT=c("CA","CA","CSE","CA"),STUDENT_COURSE=c("BCA(H)","BCA(H)","B.TECH","IMCA"))
sql_insert <- "insert into student_info values(?,?,?,?,?,?,?,?,?,?)"
dbSendUpdate(conn_db,sql_insert,student_info_df1$STUDENT_ID,student_info_df1$STUDENT_FNAME,student_info_df1$STUDENT_MNAME,student_info_df1$STUDENT_LNAME,student_info_df1$STUDENT_AGE,student_info_df1$STUDENT_GENDER,student_info_df1$STUDENT_EMAIL,student_info_df1$STUDENT_CONTACTNO,student_info_df1$STUDENT_DEPT,student_info_df1$STUDENT_COURSE)
