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

study2 <- within(study2, Condition <- relevel(Condition, ref = 2))
study2.agecheck <- lm(Age ~ as.factor(Condition), data=study2)
summary(study2.agecheck)

study2.decadedischeck <- lm(DistanceFromNewDecade ~ as.factor(Condition), data=study2)
summary(study2.decadedischeck)

study2$NineEnd <- ifelse(study2$Age == 29 | study2$Age == 39 | study2$Age == 49 | study2$Age == 59, 1, 0)
study2.obsreg <- lm(MeaningfulnessSum ~ NineEnd, data=study2)
summary(study2.obsreg)

# Study 3
study3 <- read.spss("study-3-pnas-18948.sav", to.data.frame=T)

## Number of observations
sum(study3$Membership, na.rm=T)

## Replication of reported results
chisq.test(
  c(sum(study3$Membership[study3$EndDigit == 9], na.rm=T),
    sum(study3$Membership[study3$EndDigit != 9], na.rm=T)), 
  p=c(1/10, 9/10)
  )

## 3 > 9 with comparable end digits
sum(study3$Membership[study3$EndDigit == 3 & study3$Age > 29 & study3$Age < 60], na.rm=T) > sum(study3$Membership[study3$EndDigit == 9 & study3$Age > 29 & study3$Age < 60], na.rm=T)

chisq.test(
  c(sum(study3$Membership[study3$EndDigit == 9 & study3$Age > 29 & study3$Age < 60], na.rm=T),
    sum(study3$Membership[study3$EndDigit == 3 & study3$Age > 29 & study3$Age < 60], na.rm=T)), 
  p=c(1/2, 1/2)
)

# Study 4
study4 <- read.spss("study-4-pnas-18987.sav", to.data.frame=T)

## Replication of reported results
study4.results <- lm(SuicideRate ~ NineEnd + RegionCode + Age + DeathsAll, data=study4)
summary(study4.results)

study4.ageresults <- lm(SuicideRate ~ NineEnd, data=study4)
summary(study4.ageresults)

study4$Decade <- NA
study4$Decade[study4$Age < 30] <- 0
study4$Decade[study4$Age > 29 & study4$Age < 40] <- 1
study4$Decade[study4$Age > 39 & study4$Age < 50] <- 2
study4$Decade[study4$Age > 49 & study4$Age < 60] <- 3
study4$Decade[study4$Age > 59 & study4$Age < 65] <- 4

study4.agedecresults <- lm(SuicideRate ~ NineEnd + RegionCode + Age + DeathsAll + as.factor(Decade), data=study4)
summary(study4.agedecresults)

# Study 5
study5 <- read.spss("study-5-pnas-19017.sav", to.data.frame=T)

t.test(study5$Time29,study5$Time30,paired=TRUE)
t.test(study5$Time29,study5$Time31,paired=TRUE)

t.test(study5$Time39,study5$Time40,paired=TRUE)
t.test(study5$Time39,study5$Time41,paired=TRUE)

# Study 6
study6 <- read.spss("study-6-pnas-19052.sav", to.data.frame=T)

study6$NineEnd <- ifelse(study6$Age == 29 | study6$Age == 39 | study6$Age == 49 | study6$Age == 59, 1, 0)

prop.test(sum(study6$NineEnd[study6$Age > 29 & study6$Age < 60]), nrow(study6[study6$Age > 29 & study6$Age < 60,]), p=0.1, correct=FALSE) 