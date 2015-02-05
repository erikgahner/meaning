* Data from Alter and Hershfield (2014) can be downloaded in SPSS format from http://www.openicpsr.org/repoEntity/show/18882?versionId=18882V2
* Data from World Values Survey can be downloaded in SPSS format from http://www.worldvaluessurvey.org/ (usage information required)
* To import SPSS files to STATA install -usespss- (works in STATA 12 and STATA 13): net from http://radyakin.org/transfer/usespss/beta

* Study 1
usespss "study-1-pnas-18886.sav"

recode Age (25/29=0) (30/39=1) (40/49=2) (50/59=3) (60/64=4), g(Decade)

reg Meaning NineEnd 			// Without decade control (reported by Alter and Hersfield [2014])
reg Meaning NineEnd i.Decade 	// With decade control
ologit Meaning NineEnd i.Decade // With ordered logistic regression estimation

** Original data
usespss "WorldValuesSurvey-Wave6-2010-2014_v2014-11-07_spss.sav", clear

g Age = V242 if V242 > 24 & V242 < 65

recode V143 (1=4 "Often") (2=3 "Sometimes") (3=2 "Rarely") (4=1 "Never"), g(Meaning)

g NineEnd = .
replace NineEnd = 1 if Age == 29 | Age == 39 | Age == 49 | Age == 59
replace NineEnd = 0 if Age != . & NineEnd == .

reg Meaning NineEnd
reg Meaning NineEnd if V229 != 4 & V229 != 6	// Without elderly and students
ologit Meaning NineEnd if V229 != 4 & V229 != 6 // Ordered logistic

** Original data, Wave 1
usespss "WV1_Data_spss_v_2014_04_28.sav", clear

recode v177 (1=4 "Often") (2=3 "Sometimes") (3=2 "Rarely") (4=1 "Never") (else=.), g(Meaning)

g Age = v216 if v216 > 24 & v216 < 65

g NineEnd = .
replace NineEnd = 1 if Age == 29 | Age == 39 | Age == 49 | Age == 59
replace NineEnd = 0 if Age != . & NineEnd == .

recode Age (25/29=0) (30/39=1) (40/49=2) (50/59=3) (60/64=4), g(Decade)

reg Meaning NineEnd i.Decade
ologit Meaning NineEnd i.Decade

** Original data, Wave 2
usespss "WV2_Data_spss_v_2014_04_28.sav", clear

recode v133 (1=4 "Often") (2=3 "At times") (3=2 "Rarely") (4=1 "Never") (else=.), g(Meaning)

g Age = v355 if v355 > 24 & v355 < 65

g NineEnd = .
replace NineEnd = 1 if Age == 29 | Age == 39 | Age == 49 | Age == 59
replace NineEnd = 0 if Age != . & NineEnd == .

recode Age (25/29=0) (30/39=1) (40/49=2) (50/59=3) (60/64=4), g(Decade)

reg Meaning NineEnd i.Decade
ologit Meaning NineEnd i.Decade

** Original data, Wave 3
usespss "WV3_Data_spss_v_2014_09_21.sav", clear

recode V177 (1=4 "Often") (2=3 "At times") (3=2 "Rarely") (4=1 "Never") (else=.), g(Meaning)

g Age = V216 if V216 > 24 & V216 < 65

g NineEnd = .
replace NineEnd = 1 if Age == 29 | Age == 39 | Age == 49 | Age == 59
replace NineEnd = 0 if Age != . & NineEnd == .

recode Age (25/29=0) (30/39=1) (40/49=2) (50/59=3) (60/64=4), g(Decade)

reg Meaning NineEnd i.Decade
ologit Meaning NineEnd i.Decade

** Original data, Wave 4
usespss "WV4_Data_spss_v_2014-04-28.sav", clear

recode v182 (1=4 "Often") (2=3 "At times") (3=2 "Rarely") (4=1 "Never") (else=.), g(Meaning)

g Age = v225 if v225 > 24 & v225 < 65

g NineEnd = .
replace NineEnd = 1 if Age == 29 | Age == 39 | Age == 49 | Age == 59
replace NineEnd = 0 if Age != . & NineEnd == .

recode Age (25/29=0) (30/39=1) (40/49=2) (50/59=3) (60/64=4), g(Decade)

reg Meaning NineEnd i.Decade
ologit Meaning NineEnd i.Decade

** Original data, Wave 5
usespss "WV5_Data_spss_v_2014_04_28.sav", clear

recode V184 (1=4 "Often") (2=3 "At times") (3=2 "Rarely") (4=1 "Never") (else=.), g(Meaning)

g Age = V237 if V237 > 24 & V237 < 65

g NineEnd = .
replace NineEnd = 1 if Age == 29 | Age == 39 | Age == 49 | Age == 59
replace NineEnd = 0 if Age != . & NineEnd == .

recode Age (25/29=0) (30/39=1) (40/49=2) (50/59=3) (60/64=4), g(Decade)

reg Meaning NineEnd i.Decade
ologit Meaning NineEnd i.Decade

* Study 2
usespss "study-2-pnas-18916.sav", clear

reg Age ib(2).Condition
reg DistanceFromNewDecade ib(2).Condition

g NineEnd = .
replace NineEnd = 1 if Age == 29 | Age == 39 | Age == 49 | Age == 59
replace NineEnd = 0 if Age != . & NineEnd == .

reg MeaningfulnessSum NineEnd

* Study 3
usespss "study-3-pnas-18948.sav", clear

ta EndDigit NineEnd [freq=Membership], chi2 														// Reported
ta EndDigit NineEnd [freq=Membership] if Age > 29 & Age < 60, chi2									// Comparable end digits
ta EndDigit NineEnd [freq=Membership] if EndDigit == 3 | EndDigit == 9 & Age > 29 & Age < 60, chi2 	// 3 & 9

* Study 4
usespss "study-4-pnas-18987.sav", clear

** Replication of reported results
reg SuicideRate NineEnd RegionCode Age DeathsAll

** With decade control
recode Age (25/29=0) (30/39=1) (40/49=2) (50/59=3) (60/64=4), g(Decade)
reg SuicideRate NineEnd RegionCode Age DeathsAll i.Decade

** Bivariate (insignificant)
reg SuicideRate NineEnd 


* Study 5
usespss "study-5-pnas-19017.sav", clear

ttest Time29 == Time30
ttest Time29 == Time31

ttest Time39 == Time40
ttest Time39 == Time41

* Study 6
usespss "study-6-pnas-19052.sav", clear

g NineEnd = .
replace NineEnd = 1 if Age == 29 | Age == 39 | Age == 49 | Age == 59
replace NineEnd = 0 if Age != . & NineEnd == .

ta NineEnd if Age > 29 & Age < 60

prtesti 401 0.1147 0.10
