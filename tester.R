library(jjmR)
library(tidyverse)
library(reshape2)

# setwd("assessment") # Make sure to keep the quotation marks!

h1.mod <- jjmR::readJJM("h2_0.02", path = "config", input = "input")

kobe(h1.mod, engine = "ggplot", col = "black", Bref = 1, Fref = 1)


oldnewMods <- combineModels(h1.mod)


z <- oldnewMods$h2_0.02$output



selectivities <- get_selectivities(h1.mod)



plot(oldnewMods,combine=T,what="selectivity",stack=F,fleet="all")

plot(oldnewMods,combine=T,what="recruitment",stack=F,main="Recruitment")

plot(oldnewMods,combine=T,what="ftot",stack=F,main="Total Fishing Mortality")


fishery_length <- melt(data$Flengthcomp) %>% 
  as_tibble() %>% 
  rename(fleet = Var3,
         count = value,
         year = years)
# year, length, fleets
# 


fishery_length %>% 
  group_by(year) %>% 
  summarise(seen = sum(!is.na(count))) %>% 
  View()
  

tidy_fishery_length <- fishery_length %>% 
  filter(!is.na(count)) %>% 
  group_by(year, fleet) %>% 
  mutate(count = count / sum(count))
  

lines <- data.frame(x = c(18,23, 4, 15), source =  c("chile","chile", "peru","peru"), age = factor(c(0,1,0,1)))

tidy_fishery_length %>% 
  ggplot(aes(lengths, count, fill = year, group = year)) + 
  geom_density(stat = "identity", alpha = 0.5) + 
  geom_vline(data = lines, aes(xintercept = x, color = source, linetype = age), size = 2) +
  scale_fill_viridis_c() + 
  scale_color_manual(name = "Growth Model",values = c("red","blue")) +
  labs(caption = c("mean length"))
