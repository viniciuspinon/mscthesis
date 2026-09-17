library(haven)
library(dplyr)

# BEPS
BEPS <- read_dta("Thesis/BEPS_2014_v3.dta")

# Criação das variáveis de interesse
beps <- BEPS %>%
  select(idtelefone, wave, vb11, vb12, vb13, vb14, vb15, fear2, pp10) %>%
  mutate(across(c(vb11, vb12, vb13, vb14, vb15, fear2, pp10), as.numeric)) %>%
  mutate(
    grupo = case_when(
      vb11 == 1501 | vb13 == 1501 ~ "petista",
      vb15 == 1501 ~ "antipetista",
      vb12 == 2 & vb14 == 2 ~ "nonpartisan",
      TRUE ~ NA_character_
    )
  ) %>%
  mutate(
    associa = case_when(
      fear2 == 1 ~ "associa",
      fear2 == 2 ~ "não associa",
      TRUE ~ NA_character_
    )
  ) %>%
  mutate(
    aprova = case_when(
      pp10 == 1 ~ "aprova",
      pp10 == 2 ~ "desaprova",
      TRUE ~ NA_character_
    )
  ) %>%
  filter(!is.na(grupo)) %>%
  filter(!is.na(associa)) %>%
  filter(!is.na(aprova)) # Remove NA

# Calcular as porcentagens de aprovação do Bolsa Família (pp10 == 1) por grupo
dados_plot <- beps %>%
  group_by(grupo, associa) %>%
  summarise(aprovacao_bf = mean(pp10 == 1, na.rm = TRUE) * 100) # Converte para percentual

# Plotagem
ggplot(dados_plot, aes(x = reorder(grupo, -aprovacao_bf), y = aprovacao_bf, fill = grupo)) +
  geom_col() +
  labs(
    title = "Aprovação do Bolsa-Família",
    x = "Grupo",
    y = "Aprovação (%)",
    fill = "Grupo"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )