# ------ Comparing inferential statistics ------------------------------------------------------ #
# 1. Independent samples t-test vs one way ANOVA
# 2. Dependent samples t-test
#   a.) same non-summed vs. same summed scores; not normal distribution)
#   b.) NOT the same scores non-summed vs. NOT the same summed scores; not normal distribution)
#   c.) typical survey responses; not summed vs summed
# ----------------------------------------------------------------------------------------------#

### INDEPENDENT SAMPLES T-TEST VS ONE WAY ANOVA ########################

#independent samples t test with normal distribution
x = c(1,2,2,3,3,3,4,4,5)
y = c(5,6,6,7,7,7,8,8,9)
t.test(x,y, var.equal = TRUE)

#one way anova with normal distribution
scores = c(1,2,2,3,3,3,4,4,5,5,6,6,7,7,7,8,8,9)
groupsx = as.factor(c(1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2))
df <- data.frame(scores, groupsx)
summary(aov(scores ~ groupsx, data = df))

### DEPENDENT SAMPLES T-TESTS ###########################################

#dependent samples t test [case 1.1]
# non-summed quiz scores w/ the same scores in both groups; not normal distribution
q_scores_1 = c(10,20,20,30,30,30,30,30,30,20,20,10)
groups_1 = c(1,1,1,1,1,1,2,2,2,2,2,2)
df1 <- data.frame(q_scores_1, groups_1)
t.test(q_scores_1 ~ groups_1, data = df1, paired = TRUE)

#depedent samples t-test [case 1.2]
# summed quiz scores w/ the same scores; not normal distribution
q_scores_2 <- c(30,50,60,60,50,30)
groups_2 <- c(1,1,1,2,2,2)
df2 <- data.frame(q_scores_2, groups_2)
t.test(q_scores_2 ~ groups_2, data = df2, paired = TRUE)

#dependent samples t test [case 2.1]
# non-summed quiz scores w/ NOT the same scores; not normal distribution
q_scores_3 = c(10,20,20,30,30,30,30,30,30,20,20,20)
groups_3 = c(1,1,1,1,1,1,2,2,2,2,2,2)
df3 <- data.frame(q_scores_3, groups_3)
t.test(q_scores_3 ~ groups_3, data = df3, paired = TRUE)

#depedent samples t-test [case 2.2]
# summed quiz scores w/ NOT the same scores; not normal distribution
q_scores_4 <- c(30,50,60,60,50,40)
groups_4 <- c(1,1,1,2,2,2)
df4 <- data.frame(q_scores_4, groups_4)
t.test(q_scores_4 ~ groups_4, data = df4, paired = TRUE)

#dependent samples t-test [case 3.1] 
# non-summed quiz scores. typical survey responses. 10 participants, 2 questions each.
q_scores_5 <- c(4,5, #participant 1 answers 2 pre-test questions about satisfaction (1 to 5 scale)
                4,5, #participant 2 pre test responses
                5,5,
                4,4,
                4,4,
                3,3,
                3,5,
                4,5,
                5,4,
                1,3,
                5,5, #participant 1 answers 2 post-test questions about satisfaction
                5,5, #participant 2 post test responses
                4,5,
                5,5,
                5,5,
                3,4,
                3,3,
                4,4,
                4,4,
                3,3)
groups_5 <- c(rep(1,20), rep(2,20))
df5 <- data.frame(q_scores_5, groups_5)
t.test(q_scores_5 ~ groups_5, data = df5, paired = TRUE)

#dependent samples t-test [case 3.2] 
# summed quiz scores. typical survey responses. 10 participants, 2 questions each.
q_scores_6 <- c(9, #sum of participant 1 pretest scores (4+5=9)
                9,
                10,
                8,
                8,
                6,
                8,
                9,
                9,
                4,
                10, #sum of participant 1 post test score (5+5=10)
                10,
                9,
                10,
                10,
                7,
                6,
                8,
                8,
                6)
groups_6 <- c(rep(1,10), rep(2,10))
df6 <- data.frame(q_scores_6, groups_6)
t.test(q_scores_6 ~ groups_6, data = df6, paired = TRUE)




