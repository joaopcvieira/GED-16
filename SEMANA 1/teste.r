library(tidyverse)
# Limpa area de trabalho
rm(list=ls())

# Carrega os dados em uma tabela
owid <- read_delim("data/owid.csv", delim = ",", col_names = TRUE)
str(owid)

summary(owid)

# print("Posição dos dados faltantes:")
which(is.na(owid))


owid %>% filter(deaths_solid_fuels_pollution > 1 & deaths_solid_fuels_pollution < 100) %>% 
  ggplot(aes(x = deaths_solid_fuels_pollution)) +
  geom_histogram(aes(y = after_stat(density))) +
  geom_density(lwd = 1, colour = 4,
               fill = 4, alpha = 0.25)
#   geom_rug(alpha = 0.5)


plot(owid[, c("deaths_solid_fuels_pollution", "deaths_air_pollution", 
              "deaths_ozone", "deaths_sanitation", "deaths_air_pollution")])

ggplot(owid, aes(x = life_expectancy, fill = continent)) +
  geom_density(alpha = 0.25, position = "identity") 
    # geom_histogram(alpha = 0.25, position = "identity")






