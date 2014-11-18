# Do people search for meaning when they approach a new decade in chronological age?

In a paper published in the Proceedings of the National Academy of Sciences, [People search for meaning when they approach a new decade in chronological age](http://www.pnas.org/content/early/2014/11/12/1415086111.abstract), Adam L. Alter and Hal E. Hershfield conclude that "adults undertake a search for existential meaning when they approach a new decade in age (e.g., at ages 29, 39, 49, etc.) or imagine entering a new epoch, which leads them to behave in ways that suggest an ongoing or failed search for meaning (e.g., by exercising more vigorously, seeking extramarital affairs, or choosing to end their lives)". Across six studies the authors find significant effects of being a so-called 9-ender on a variety of measures related to meaning searching activities. The study is getting coverage, among other places, here:

- Daily Mail: [Does your partner have a milestone birthday coming up? Beware - they may be more likely to CHEAT, warns study](http://www.dailymail.co.uk/sciencetech/article-2839670/Does-partner-milestone-birthday-coming-Beware-likely-CHEAT-warns-study.html)
- Research Digest: [Why you're particularly likely to run your first marathon when your age ends in a "9"](http://digest.bps.org.uk/2014/11/why-youre-particularly-likely-to-run.html)

I show that each of the six studies in the paper consist of at least one crucial deficiency hindering meaningful inferences. In several of the studies the results stems from the fact that the end digits are not comparable as 9, for example, is more likely to be found among younger age decades as the age range in all the studies is from 25 to 65. In other words, if people are more likely to engage in an activity at a younger age compared to later in life, higher end digits are more likely to measure such differences compared to lower end digits. When controlling properly for age the differences reported in some of the studies fails to reach statistical significance. In other studies, results were questionable due to empirical shortcomings.

Go read the study before reading any further. I will assume you did so. All information needed to get the results reported here is in `meaning-letter.R`.

## Study 1: Search for meaning in 100 countries
In Study 1, the authors use data from the World Values Survey. They conclude that "9-enders reported questioning the meaning or purpose of life more than respondents whose ages ended in any other digit". However, if one take age decades into consideration, the 9-ender effects fails to reach statistical significance (p=0.71) despite the sample size of 42.063. 

## Study 2: The experiment in the paper
In Study 2, age decades are less relevant due to the experimental design. Here the authors find significant effects of the experimental stimuli, and the effects seem robust. However, no randomization tests are reported. One sees that the experimental group differ systematically from both the baseline and control group on pre-randomization measured variables. People in the experimental group are, for example, on average over 6 years younger than the baseline group (p<0.001) and have a higher distanace to a new decade than the control group (p=0.02), questioning the possibility to draw design-based inferences. 

Furthermore, on an observational note, there is no effect of having a 9-ending age on meaningful thoughts in this study. 

## Study 3: 29? Cheater!
In Study 3, the authors argue that 9-enders are more likely to seek extramarital affairs. What did the authors do here? They "categorized 8,077,820 male users, aged between 25 and 64 years, according to the final digit of their ages. There were 952,176 9-enders registered on the site".

Before looking at the data, one can ask two questions. First, whether those aged 50 are more likely to report the age of 49. The authors argue that this is not the case, but I am not convinced. Second, and something the authors doesn't discuss, whether age is a good proxy for the age users had when they signed up at the specific site (unless everybody signed up before in the months before November 2013). 

When making end digits comparable, i.e. looking at decades with all end digits, 9-enders no longer conducts most adultery, but 3-enders (the mode is 33 in this study [I guess the default age at sign up was January 1st 1980]) and this difference is significant (p<0.001). 

## Study 4: A dead cheater.
In Study 4, the authors look at suicide victims across the United States between 2000 and 2011 and show that 9-enders are more likely to commit suicide. Interestingly, the zero-order correlation between suicide rate and 9-enders is non-significant. In the model conducted by the authors (which shows a significant result), when controlling properly for age, the effect of 9-enders fails to reach statistical significance (p=0.13).

## Study 5: Run, 9-ender, run!
In Study 5, the authors show that runners who completed marathons faster at age 29 or 39. However, simple tests show that there is no statistical evidence that people run faster when they are 29 compared to when they are 30 (p=0.2549) or 31 (p= 0.8908) and the same is the case for when they are 39 compared to 40 (p=0.9285) and 41 (p=0.5254). Hence, there is no robust evidence that it is the 9-ender effect which drives the results reported by the authors. 

## Study 6: Or, at least begin to run.
In Study 6, the authors look at the age at which 500 athletes ran their first marathon. Again, we see that the 9-ender effect is non-significant if we look at whole decades (p=0.3265), i.e. when making the end digits comparable.