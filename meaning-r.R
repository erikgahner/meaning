# Data from Alter and Hershfield (2014) can be downloaded in SPSS format from http://www.openicpsr.org/repoEntity/show/18882?versionId=18882V2
# Data from World Values Survey can be downloaded in SPSS format from http://www.worldvaluessurvey.org/ (usage information required)

library(foreign)
library(MASS)

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

## Result with ordered logistic regression
study1.agecontrol.logistic <- polr(as.factor(Meaning) ~ NineEnd + as.factor(Decade), data=study1, Hess=T)
summary(study1.agecontrol.logistic)

## Original data, Wave 6
study1.org <- read.spss("WorldValuesSurvey-Wave6-2010-2014_v2014-11-07_spss.sav", to.data.frame=T)

study1.org$Age <- study1.org$V242
study1.org <- study1.org[study1.org$Age > 24 & study1.org$Age < 65,]
nrow(study1.org)

study1.org$Meaning <- NA
study1.org$Meaning[study1.org$V143 == "Never"] <- 1
study1.org$Meaning[study1.org$V143 == "Rarely"] <- 2
study1.org$Meaning[study1.org$V143 == "Sometimes"] <- 3
study1.org$Meaning[study1.org$V143 == "Often"] <- 4

study1.org$NineEnd <- ifelse(study1.org$Age == 29 | study1.org$Age == 39 | study1.org$Age == 49 | study1.org$Age == 59, 1, 0)

study1.org.result <- lm(Meaning ~ NineEnd, data=study1.org)
summary(study1.org.result)

study1.org.r.studentsold <- lm(Meaning ~ NineEnd, data=study1.org[study1.org$V229 != 4 & study1.org$V229 != 6,])
summary(study1.org.r.studentsold)

study1.org.studentsold.logistic <- polr(as.factor(Meaning) ~ NineEnd, data=study1.org[study1.org$V229 != 4 & study1.org$V229 != 6,], Hess=T)
summary(study1.org.studentsold.logistic)

## Original data, Wave 1
study1.w1 <- read.spss("WV1_Data_spss_v_2014_04_28.sav", to.data.frame=T)

study1.w1$Meaning <- NA
study1.w1$Meaning[study1.w1$v177 == "Never"] <- 1
study1.w1$Meaning[study1.w1$v177 == "Rarely"] <- 2
study1.w1$Meaning[study1.w1$v177 == "Sometimes"] <- 3
study1.w1$Meaning[study1.w1$v177 == "Often"] <- 4

study1.w1$Age <- study1.w1$v216
study1.w1 <- study1.w1[study1.w1$Age > 24 & study1.w1$Age < 65,]

study1.w1$NineEnd <- ifelse(study1.w1$Age == 29 | study1.w1$Age == 39 | study1.w1$Age == 49 | study1.w1$Age == 59, 1, 0)

study1.w1$Decade <- NA
study1.w1$Decade[study1.w1$Age < 30] <- 0
study1.w1$Decade[study1.w1$Age > 29 & study1.w1$Age < 40] <- 1
study1.w1$Decade[study1.w1$Age > 39 & study1.w1$Age < 50] <- 2
study1.w1$Decade[study1.w1$Age > 49 & study1.w1$Age < 60] <- 3
study1.w1$Decade[study1.w1$Age > 59 & study1.w1$Age < 65] <- 4

study1.w1.result <- lm(Meaning ~ NineEnd + as.factor(Decade), data=study1.w1)
summary(study1.w1.result)

study1.w1.logistic <- polr(as.factor(Meaning) ~ NineEnd + as.factor(Decade), data=study1.w1, Hess=T)
summary(study1.w1.logistic)

## Original data, Wave 2
study1.w2 <- read.spss("WV2_Data_spss_v_2014_04_28.sav", to.data.frame=T, use.value.labels = F)

study1.w2$Meaning <- NA
study1.w2$Meaning[study1.w2$v133 == 4] <- 1
study1.w2$Meaning[study1.w2$v133 == 3] <- 2
study1.w2$Meaning[study1.w2$v133 == 2] <- 3
study1.w2$Meaning[study1.w2$v133 == 1] <- 4

study1.w2$Age <- study1.w2$v355
study1.w2 <- study1.w2[study1.w2$Age > 24 & study1.w2$Age < 65,]

study1.w2$NineEnd <- ifelse(study1.w2$Age == 29 | study1.w2$Age == 39 | study1.w2$Age == 49 | study1.w2$Age == 59, 1, 0)

study1.w2$Decade <- NA
study1.w2$Decade[study1.w2$Age < 30] <- 0
study1.w2$Decade[study1.w2$Age > 29 & study1.w2$Age < 40] <- 1
study1.w2$Decade[study1.w2$Age > 39 & study1.w2$Age < 50] <- 2
study1.w2$Decade[study1.w2$Age > 49 & study1.w2$Age < 60] <- 3
study1.w2$Decade[study1.w2$Age > 59 & study1.w2$Age < 65] <- 4

study1.w2.result <- lm(Meaning ~ NineEnd + as.factor(Decade), data=study1.w2[study1.w2$Age > 24 & study1.w2$Age < 65,])
summary(study1.w2.result)

study1.w2.logistic <- polr(as.factor(Meaning) ~ NineEnd + as.factor(Decade), data=study1.w2[study1.w2$Age > 24 & study1.w2$Age < 65,], Hess=T)
summary(study1.w2.logistic)

## Original data, Wave 3
study1.w3 <- read.spss("WV3_Data_spss_v_2014_09_21.sav", to.data.frame=T)

study1.w3$Meaning <- NA
study1.w3$Meaning[study1.w3$V177 == "Never"] <- 1
study1.w3$Meaning[study1.w3$V177 == "Rarely"] <- 2
study1.w3$Meaning[study1.w3$V177 == "Sometimes"] <- 3
study1.w3$Meaning[study1.w3$V177 == "Often"] <- 4

study1.w3$Age <- study1.w3$V216
study1.w3 <- study1.w3[study1.w3$Age > 24 & study1.w3$Age < 65,]

study1.w3$NineEnd <- ifelse(study1.w3$Age == 29 | study1.w3$Age == 39 | study1.w3$Age == 49 | study1.w3$Age == 59, 1, 0)

study1.w3$Decade <- NA
study1.w3$Decade[study1.w3$Age < 30] <- 0
study1.w3$Decade[study1.w3$Age > 29 & study1.w3$Age < 40] <- 1
study1.w3$Decade[study1.w3$Age > 39 & study1.w3$Age < 50] <- 2
study1.w3$Decade[study1.w3$Age > 49 & study1.w3$Age < 60] <- 3
study1.w3$Decade[study1.w3$Age > 59 & study1.w3$Age < 65] <- 4

study1.w3.result <- lm(Meaning ~ NineEnd + as.factor(Decade), data=study1.w3)
summary(study1.w3.result)

study1.w3.logistic <- polr(as.factor(Meaning) ~ NineEnd + as.factor(Decade), data=study1.w3, Hess=T)
summary(study1.w3.logistic)

## Original data, Wave 4
study1.w4 <- read.spss("WV4_Data_spss_v_2014-04-28.sav", to.data.frame=T)

study1.w4$Meaning <- NA
study1.w4$Meaning[study1.w4$v182 == "Never"] <- 1
study1.w4$Meaning[study1.w4$v182 == "Rarely"] <- 2
study1.w4$Meaning[study1.w4$v182 == "Sometimes"] <- 3
study1.w4$Meaning[study1.w4$v182 == "Often"] <- 4

study1.w4$Age <- study1.w4$v225
study1.w4 <- study1.w4[study1.w4$Age > 24 & study1.w4$Age < 65,]

study1.w4$NineEnd <- ifelse(study1.w4$Age == 29 | study1.w4$Age == 39 | study1.w4$Age == 49 | study1.w4$Age == 59, 1, 0)

study1.w4$Decade <- NA
study1.w4$Decade[study1.w4$Age < 30] <- 0
study1.w4$Decade[study1.w4$Age > 29 & study1.w4$Age < 40] <- 1
study1.w4$Decade[study1.w4$Age > 39 & study1.w4$Age < 50] <- 2
study1.w4$Decade[study1.w4$Age > 49 & study1.w4$Age < 60] <- 3
study1.w4$Decade[study1.w4$Age > 59 & study1.w4$Age < 65] <- 4

study1.w4.result <- lm(Meaning ~ NineEnd + as.factor(Decade), data=study1.w4)
summary(study1.w4.result)

study1.w4.logistic <- polr(as.factor(Meaning) ~ NineEnd + as.factor(Decade), data=study1.w4, Hess=T)
summary(study1.w4.logistic)

## Original data, Wave 5
study1.w5 <- read.spss("WV5_Data_spss_v_2014_04_28.sav", to.data.frame=T)

study1.w5$Meaning <- NA
study1.w5$Meaning[study1.w5$V184 == "Never"] <- 1
study1.w5$Meaning[study1.w5$V184 == "Rarely"] <- 2
study1.w5$Meaning[study1.w5$V184 == "Sometimes"] <- 3
study1.w5$Meaning[study1.w5$V184 == "Often"] <- 4

study1.w5$Age <- study1.w5$V237
study1.w5 <- study1.w5[study1.w5$Age > 24 & study1.w5$Age < 65,]

study1.w5$NineEnd <- ifelse(study1.w5$Age == 29 | study1.w5$Age == 39 | study1.w5$Age == 49 | study1.w5$Age == 59, 1, 0)

study1.w5$Decade <- NA
study1.w5$Decade[study1.w5$Age < 30] <- 0
study1.w5$Decade[study1.w5$Age > 29 & study1.w5$Age < 40] <- 1
study1.w5$Decade[study1.w5$Age > 39 & study1.w5$Age < 50] <- 2
study1.w5$Decade[study1.w5$Age > 49 & study1.w5$Age < 60] <- 3
study1.w5$Decade[study1.w5$Age > 59 & study1.w5$Age < 65] <- 4

study1.w5.result <- lm(Meaning ~ NineEnd + as.factor(Decade), data=study1.w5)
summary(study1.w5.result)

study1.w5.logistic <- polr(as.factor(Meaning) ~ NineEnd + as.factor(Decade), data=study1.w5, Hess=T)
summary(study1.w5.logistic)

## Results
### Wave 1
summary(study1.w1.result)$coefficients[2,1]     ## coef
summary(study1.w1.result)$coefficients[2,4]     ## p-value
### Wave 2
summary(study1.w2.result)$coefficients[2,1]     ## coef
summary(study1.w2.result)$coefficients[2,4]     ## p-value
### Wave 3
summary(study1.w3.result)$coefficients[2,1]     ## coef
summary(study1.w3.result)$coefficients[2,4]     ## p-value
### Wave 4
summary(study1.w4.result)$coefficients[2,1]     ## coef
summary(study1.w4.result)$coefficients[2,4]     ## p-value
### Wave 5
summary(study1.w5.result)$coefficients[2,1]     ## coef
summary(study1.w5.result)$coefficients[2,4]     ## p-value

# Study 2
study2 <- read.spss("study-2-pnas-18916.sav", to.data.frame=T)

study2 <- within(study2, Condition <- relevel(Condition, ref = 2))
study2.agecheck <- lm(Age ~ as.factor(Condition), data=study2)
summary(study2.agecheck)

study2.decadedischeck <- lm(DistanceFromNewDecade ~ as.factor(Condition), data=study2)
summary(study2.decadedischeck)

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