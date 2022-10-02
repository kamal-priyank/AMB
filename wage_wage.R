wage <- read.table(file="wage.txt", sep="\t", quote="", comment.char="")
wage$ethnicity<-ifelse(wage$ethnicity=="cauc",1,0)
wage$smsa<-ifelse(wage$smsa=="yes",1,0)
head(wage)
wage$region <- as.numeric(factor(wage$region) )-1
wage<-cbind(wage,dummy(wage$ethnicity,sep="_"))
write.csv(wage,"wage_clean.csv", row.names=FALSE)

hage <- read.csv(file="wage_clean.csv")
hage$wage = log10(hage$wage)
hage$experience[hage$experience < 0] <- NA
hage<- subset(hage,experience!= "NA")
hage<- hage %>% mutate(id = row_number())
write.csv(hage,"wage_wage.csv", row.names =FALSE)

mydata<- read.csv(file="wage_wage.csv")
mydata.cor = cor(mydata)
mydata.cor = cor(mydata, method = c("spearman"))
library("Hmisc")
mydata.rcorr = rcorr(as.matrix(mydata))
mydata.rcorr
mydata.coeff = mydata.rcorr$r
mydata.p = mydata.rcorr$P
library(corrplot)
corrplot(mydata.cor)

