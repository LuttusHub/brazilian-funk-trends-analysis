library(tidyverse)
library(patchwork)
funk_brasil <- read_csv("Data/funk_BR.csv", skip = 2)
brazilianfunk_global <- read_csv('Data/BrazilianFunk_global.csv', skip = 2)

funk_brasil <- funk_brasil %>% 
  rename(data = 1, interesse = 2)

brazilianfunk_global <- brazilianfunk_global %>% 
  rename(data = 1, interesse = 2)


grafic1 <- ggplot(funk_brasil, aes(x = data, y = interesse)) + geom_line(color = "#54216e", size = 1) +
  theme_minimal() + labs(title = "O declínio da busca pelo 'funk' no Brasil",
                         subtitle = "Análise temporal 2004-2025",
                         x = "Ano",
                         y = "Índice de popularidade (0-100)",
                         caption = "Fonte: Google Trends"
  )



grafic2 <- ggplot(brazilianfunk_global, aes(x = data, y = interesse)) +
  geom_line(color = "#FF5722", size = 1) +
  theme_minimal() +
  labs(
    title = "A Ascensão Global do 'Brazilian Funk'",
    subtitle = "Interesse mundial a partir de 2023",
    x = "Ano",
    y = "Índice de Popularidade (0-100)",
    caption = "Fonte: Google Trends"
  )

grafic1/grafic2
