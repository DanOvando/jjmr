library(jjmR)
library(tidyverse)

# setwd("assessment") # Make sure to keep the quotation marks!

h1.mod <- jjmR::readJJM("h1_1.00", path = "config", input = "input")
a = jjmR::kobe(h1.mod, engine = "ggplot", col = "black", Bref = 1, Fref = 1)

oldnewMods <- combineModels(h1.mod)

plot(oldnewMods,combine=T,what="biomass",stack=F,main="Biomass")

plot(oldnewMods,combine=T,what="recruitment",stack=F,main="Recruitment")

plot(oldnewMods,combine=T,what="ftot",stack=F,main="Total Fishing Mortality")
