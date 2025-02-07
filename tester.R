library(here)
library(ggplot2)
library(tidyverse)
library(jjmR)
# mod0.00 <- runit(geth("0.00"),pdf=TRUE,portrait=F,est=TRUE,exec="../src/jjms")
mod0.00 <- readJJM("h2_0.00", path = "config", input = "input")

load("results/mod_prev_h1.Rdat")

old_vs_new_mods <- combineModels(mod0.00,mod_prev)


selectivities <- get_selectivities(old_vs_new_mods)


plot_selectivities(selectivities)


plot(old_vs_new_mods,what="selectivity",fleet="fsh", alpha = 0.2, scale = 10,
     years = 2000:2020)


plot(mod0.00,what="selectivity",fleet="ind", alpha = 0.2, scale = 10,
     years = 2015:2020)

a = get_msy_mt(old_vs_new_mods)

kobe(mod0.00, engine = "ggplot")

kobe(old_vs_new_mods, engine = "lattice")

a = get_catchabilities(mod0.00)



a %>% 
  ggplot(aes(year, q, color = model)) + 
  geom_line() + 
  facet_wrap(~ index, scales = "free_y")


totals <- get_totals(old_vs_new_mods)


totals %>% 
  ggplot(aes(year, value, color = stock, linetype = model)) + 
  geom_line() + 
  facet_wrap(~ metric, scales = "free_y")


index_fits <- get_index_fits(old_vs_new_mods)

index_fits %>% 
  ggplot() + 
  geom_pointrange(aes(year, observed_ind, ymin = observed_ind - 1.96 * observed_se, ymax =  observed_ind + 1.96 * observed_se)) +
  geom_path(aes(year, pred_ind, color = model)) + 
  facet_wrap(~ index, scales = "free_y")


age_fits <- get_age_fits(old_vs_new_mods)


age_fits %>% 
  filter(model == "h2_0.00", stock == "Stock_1", source == "fsh_1") %>% 
  pivot_longer(predicted:observed) %>% 
  ggplot() + 
  geom_density(aes(age, value, fill = name),stat = "identity", alpha = 0.5) + 
  facet_wrap(~year)


recruits <- get_recruits(old_vs_new_mods)

fishing_mortality <- get_fishing_mortality(old_vs_new_mods)

fishing_mortality %>% 
  ggplot(aes(year, mortality, color = age, group = age)) + 
  geom_line() + 
  facet_grid(model~stock)

tidy_jjm <- tidy_JJM(old_vs_new_mods)
str(tidy_jjm)
