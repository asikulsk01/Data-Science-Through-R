install.packages("ggplot2")
install.packages("purrr")
install.packages("devtools")
devtools::install_github("hadley/emo")
remotes::install_github("hadley/emo",force=TRUE)

library(ggplot2)
library(dplyr)
library(purrr)
library(tibble)
library(emo)


dat = tibble(names = c("smile","school","office","blush","smirk","heart_eyes"),emoji = map_chr(names,emo::ji_name)) %>% tibble::rowid_to_column("n") 
dat %>% ggplot(aes(n, emoji)) 
geom_col(orientation="y") 
theme(axis.text.y = element_text(size = 18))
