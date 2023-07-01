

example_dat <- n1 %>% dplyr::select(q6,ageclass,q52)

  
example_dat$q6 <-   ifelse(example_dat$q6 %in% c("Yes, daily", "Yes, occasionally"), "Yes", "No") 

#example_dat <- example_dat %>% drop_na(q6) %>% mutate(q6_binary = as.numeric(as.factor(q6)) -1)

### making the predictors characters first and then factors preserves the labels when running the logistic regression
example_dat <- example_dat %>% drop_na(q6) %>% mutate(q6_binary = as.factor(q6), 
                                                      ageclass = as.factor(as.character(ageclass)),
                                                      q52 = as.factor(as.character(q52))) 


logistic_mod <- glm(q6_binary ~ ageclass + q52, data = example_dat, family = "binomial")
logistic_mod
