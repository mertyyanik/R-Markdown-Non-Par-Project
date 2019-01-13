#Soru 1
Bagimsiz <- read.delim("C:/Users/user/Desktop/NonPar/Bagimsiz.txt")
attach(Bagimsiz)
print(Bagimsiz)

shapiro.test(A.Makinesi)
shapiro.test(B.Makinesi)
shapiro.test(C.Makinesi)

#Soru 2
Bagimli <- read.delim("C:/Users/user/Desktop/NonPar/Bagimli.txt")
attach(Bagimli)
print(Bagimli)

shapiro.test(Saat0)
shapiro.test(Saat24)
shapiro.test(Saat72)

#Soru 3
attach(Bagimsiz)

install.packages("DescTools")
library(DescTools)
SignTest(A.Makinesi,mu=350)

install.packages("stats")
library(stats)
wilcox.test(A.Makinesi,mu=350)

#Soru4
attach(Bagimsiz)

install.packages("stats")
library(stats)
wilcox.test(A.Makinesi,B.Makinesi)

#Soru5
attach(Bagimli)

install.packages("stats")
library(stats)
wilcox.test(Saat24,Saat72,paired = TRUE)

#Soru6
library(stats)
install.packages("PMCMRplus")
library(PMCMRplus)

attach(Bagimsiz)
kruskal.test(Bagimsiz)

#Soru 7
attach(Bagimli)
forFriedman=matrix(c(Bagimli[,1],Bagimli[,2],Bagimli[,3]),nrow = 5,
                   dimnames = list(1:5,c("0.Saat","24.Saat","72.Saat")))
friedman.test(forFriedman)





