## This file converts data from .dta (which is a proprietary STATA type)
## into an open .csv format. 

library(tidyverse)
library(haven)
library(here)

## Load the data 
d <- haven::read_dta(here("data", "raw", "hajj_public.dta"))

## rename these insane variable names... 

d <- d %>% 
  rename(
    ## views about religious practice 
    regarded_as_religious   = x_s14aq10, 
    ## views about groups of peoples 
    ## ranging from +2 (very positive) to -2 (very negative)
    views_about_saudis      = x_s15cq5, 
    views_about_indonesians = x_s15cq6, 
    views_about_turks       = x_s15cq7, 
    views_about_africans    = x_s15cq8, 
    views_about_europeans   = x_s15cq10, 
    views_about_chinese     = x_s15cq9,
    ## views toward women; 
      ## 0 = "men are better or equal", 
      ## 1 = "women are better"
    equal_intellect = x_s10dq15a, 
    equal_spiritual = x_s10dq15b, 
    equal_ethical   = x_s10dq15c, 
    equal_status    = x_s10dq18, 
    ## girls education
    girls_should_attend = x_s10eq2, 
    ## won the hajj lottery 
    won_lottery = success)

# write to csv 
write.csv(d, here("data", "processed", "hajj_public.csv"), row.names = FALSE)
