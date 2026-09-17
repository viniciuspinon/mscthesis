#métricas
library(lubridate)

metricas_2 <- conjoint_2 %>%
  slice(-c(1:2)) %>%
  filter(time != "") %>%
  filter(Finished == "True") %>%
  filter(DistributionChannel != "Preview") %>%
  mutate(
    duration = as.numeric(Duration..in.seconds.),  # Converter para numérico
    tempo_formatado = seconds_to_period(duration) # Converte segundos para "minutos e segundos"
  )

metricas_3 <- conjoint_3 %>%
  slice(-c(1:2)) %>% 
  filter(time == "") %>%
  filter(Finished == "True") %>%
  mutate(
    duration = as.numeric(Duration..in.seconds.),  # Converter para numérico
    tempo_formatado = seconds_to_period(duration) # Converte segundos para "minutos e segundos"
  )

# completas = 1094, filtradas = 883, completas + filtradas = 1977

# completas = 768, filtradas = 491, completas + filtradas = 1259