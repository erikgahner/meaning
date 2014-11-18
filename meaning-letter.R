# Data sets can be downloaded in SPSS format from http://www.openicpsr.org/repoEntity/show/18882?versionId=18882V2

library(foreign)

# Study 1
study1 <- read.spss("study-1-pnas-18886.sav", to.data.frame=T)

study1$Decade <- NA
study1$Decade[study1$Age < 30] <- 0
study1$Decade[study1$Age > 29 & study1$Age < 40] <- 1
study1$Decade[study1$Age > 39 & study1$Age < 50] <- 2
study1$Decade[study1$Age > 49 & study1$Age < 60] <- 3
study1$Decade[study1$Age > 59 & study1$Age < 65] <- 4

## Replication of reported result
study1.reported <- lm(Meaning ~ NineEnd, data=study1)
summary(study1.reported)

## Result with age decade control
study1.agecontrol <- lm(Meaning ~ NineEnd + as.factor(Decade), data=study1)
summary(study1.agecontrol)

# Study 2
study2 <- read.spss("study-2-pnas-18916.sav", to.data.frame=T)
head(study2)