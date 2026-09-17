# Codificar as características e níveis em variáveis numéricas
conjoint_encoded <- conjoint_final %>%
  mutate(
    feature_apoio = ifelse(feature_apoio == "Teve apoio dos principais políticos e partidos.", 1, 0),
    feature_const = ifelse(feature_const == "Está na Constituição.", 1, 0),
    feature_tempo = ifelse(feature_tempo == "Existe há muito tempo.", 1, 0),
    feature_gestao = ifelse(feature_gestao == "É gerida por uma agência independente do Ministério responsável pela política.", 1, 0),
    feature_efic = ifelse(feature_efic == "Conseguiu atingir os objetivos pretendidos pela política.", 1, 0)
  )

model <- lm(out ~ feature_apoio + feature_const + feature_tempo + feature_gestao + feature_efic, data = conjoint_encoded)

coefficients <- coef(model)
coefficients

data(herbata)
