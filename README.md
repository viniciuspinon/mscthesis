# Survey of Public Policies: Institutionalization and Policy Ownership

Repositório com os códigos de análise, instrumentos de questionário e scripts da minha dissertação de mestrado (FGV-EBAPE).

---

## 📂 Estrutura das Pastas

```text
Thesis/
├── 01_planning_docs/           # Planos de Pré-Análise (PAP)
├── 02_survey_instruments/      # Instrumentos de coleta e randomizador do Conjoint (JS/HTML/PDF)
├── 03_raw_data/                # Bases de dados brutas (armazenadas localmente)
├── 04_scripts_archive/         # Scripts preliminares, testes e pilotos
└── Vinicius_Thesis/            # Projeto principal (RStudio)
    ├── Thesis Final Version.Rmd# Texto e modelos estatísticos em R Markdown
    ├── Slides.Rmd              # Slides da apresentação
    ├── citations.bib           # Referências bibliográficas
    └── plots/                  # Gráficos e figuras geradas (AMCE, etc.)
```

---

## 🛠️ Como Executar

1. Abra o projeto [`Vinicius_Thesis/Vinicius_Thesis.Rproj`](Vinicius_Thesis/Vinicius_Thesis.Rproj) no RStudio.
2. Compile o arquivo [`Vinicius_Thesis/Thesis Final Version.Rmd`](Vinicius_Thesis/Thesis%20Final%20Version.Rmd).

*Principais pacotes R utilizados:* `tidyverse`, `cregg`, `cjoint`, `modelsummary`, `sandwich`, `knitr`, `rmarkdown`.
