

example_dat <- n1 %>% dplyr::select(q6,ageclass,q52)
  
  
example_dat$q6 <-   ifelse(example_dat$q6 %in% c("Yes, daily", "Yes, occasionally"), "Yes", "No") 

#example_dat <- example_dat %>% drop_na(q6) %>% mutate(q6_binary = as.numeric(as.factor(q6)) -1)
example_dat <- example_dat %>% drop_na(q6) %>% mutate(q6_binary = as.factor(q6), ageclass = as.factor(ageclass))

logistic_mod <- glm(q6_binary ~ ageclass + q52, data = example_dat, family = "binomial")
logistic_mod
