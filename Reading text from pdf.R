install.packages("pdftools")
library(pdftools)

files =list.files(pattern = "pdf$")
print(files)

terms=lapply(files, pdf_text)
print(terms)
length(terms)
lapply(terms,length)