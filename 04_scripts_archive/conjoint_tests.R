

if(!require(devtools)) install.packages("devtools")
library(devtools)
devtools::install_github("m-freitag/cjpowR")
library(cjpowR)
# This gives the minimum required effective sample size (type S, E(type M)):

df = cjpowr_amce(amce = 0.05, power = 0.8, levels = 2)

# For example, for a conjoint with 2 profiles and 2 tasks, n becomes:
df$n/(2*2)

#This gives the power (type S, E(type M)):
cjpowr_amce(amce = 0.05, n = 3132, levels = 2)

#Generating an interactive plot for type M error:

d <- expand.grid(
  amce = c(0.01, 0.02, 0.03, 0.05), 
  n = seq(from = 100, to = 50000, length.out = 1000), # power if minimum required effective sample size is of interest 
  alpha = 0.05, 
  levels = 2,
  treat.prob = 0.5,
  sims = 10000 # set to 0 if you want to plot something else than Type M error
)

df <- list2DF(do.call(cjpowr_amce, d))

library(plotly)
plot_ly(df, x = ~n, y = ~exp_typeM, type = 'scatter', mode = 'lines', linetype = ~amce) %>%
  layout(
    xaxis = list(title = "Effective Sample Size",
                 zeroline = F,
                 hoverformat = '.0f'),
    yaxis = list(title = "Exaggeration Ratio",
                 range = c(0,10),
                 zeroline = F,
                 hoverformat = '.2f'),
    legend=list(title=list(text='<b> AMCE </b>')),
    hovermode = "x unified"
  )

# Criar a tabela de dados


write_csv(policies, "policies.csv")

## Importing data through qualtRics

```{r}
# Set up Qualtrics credentials
qualtrics_api_credentials(
  api_key=Sys.getenv("QUALTRICS_API_KEY"), # Configure sua chave como variável de ambiente
  base_url="fgvspmarketing.qualtrics.com",
  overwrite = TRUE,
  install=FALSE)

# Get survey ids on qualtrics
surveys <- all_surveys()
surv.id <- surveys$id[which(surveys$name=="Conjoint")]

# Download the lottery
questions <- survey_questions(surveyID =  surv.id)
surv <- fetch_survey(surveyID = surv.id #sets the parameters for the download (see documentation)
                     , label=F
                     , convert=F
                     , local_time=T
                     , unanswer_recode = "-98"
                     , force_request=T)
```

conjoint_encoded %>%
  count(Apoio) %>%
  mutate(percentage = n / sum(n) * 100) %>%
  count(Legal) %>%
  mutate(percentage = n / sum(n) * 100) 
