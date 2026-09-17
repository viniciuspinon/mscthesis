
# Tentativa com CJOINT
conjoint_reshape <- conjoint %>%
  #first step is gathering all the variables that we want to use as our attributes;
  #because we have named each task iteration in this format, using contains will get each conjoint-related variable
  gather(key = task, value = score, contains("_1"), contains("_2")) %>% 
  mutate(task = gsub("\\.", "_", task)) %>%
  mutate(task = gsub("feature_", "", task)) %>%
  #we need to separate these variables out by characteristics; this can be done using `separate`, because variable were meaningfully named using underscores 
  separate(task, c("variable", "iteration", "index")) %>% 
  #creating an indicator of variables that were a part of an index
  mutate(index = ifelse(is.na(index), "", index))  %>%
  #create a variable specific column
  unite("variable_index", c("variable", "index"), sep = "") %>% 
  #spreading out the variables so that each meaningful variable (or attribute) is a column
  spread(key = variable_index, value = score) %>% 
  #lastly, because the data are a mix of upper and lower case, I use clean_names to make the variables names follow a uniform convention (this is optional, but recommended)
  janitor::clean_names() 

conjoint_clean <- conjoint_reshape %>%
  #first, we want to make sure our outcome of interest is a numeric variable
  mutate(c1 = as.numeric(c1)) %>% 
  #next, we want to make sure our predictors of interest are factors
  mutate_if(is.character, as.factor) %>%  
  #lastly, we want to make sure our outcome of interest has no missing values (either by filtering them out, or through MI, etc...)
  filter(!is.na(c1))

conjoint_clean %>%  
  amce(formula = out ~ feature_apoio + feature_const + feature_tempo 
       + feature_gestao + feature_efic) %>% 
  plot()
