library(tidyverse)
library(ggpubr)
setwd(dir = "C:/Users/Javis/Desktop/STAT 151/R-linear-modeling/HW1")

# Question 1
data <- read.csv("spotify_songs.csv", encoding = "UTF - 8")
ggplot(data, aes(x = danceability, y = track_popularity)) + geom_point()
model <- lm(track_popularity ~ danceability, data = data)
summary(model)
ggplot(data, aes(danceability, track_popularity)) + geom_point() + 
  stat_smooth(method = lm)

ggplot(data, aes(x = energy, y = track_popularity)) + geom_point()
model <- lm(track_popularity ~ energy, data = data)
summary(model)
ggplot(data, aes(energy, track_popularity)) + geom_point() + 
  stat_smooth(method = lm)

data_2 <- data[which(data$track_popularity > 10),]
ggplot(data_2, aes(x = energy, y = track_popularity )) + geom_point()
model <- lm(track_popularity ~ energy, data = data_2)
summary(model)
ggplot(data_2, aes(energy, track_popularity)) + geom_point() + 
  stat_smooth(method = lm)

# Question 2
# a)
data <- read.csv("bodyfat.csv", encoding = "UTF - 8")
model <- lm(bodyfat ~ Weight + Height, data = data)
summary (model)

# b)
x1 <- data$Weight
x2 <- data$Height
y <- data$bodyfat

X <- matrix(c(rep(1, length(x1)), x1, x2), nrow = length(x1))
Y <- matrix(y)
beta_hat <- solve(t(X) %*% X) %*% t(X) %*% y
beta_hat 

# c)
calc_beta <- function(X, Y){
  beta_hat <- solve(t(X) %*% X) %*% t(X) %*% Y
  
  return(beta_hat)
}
calc_beta(X,Y)

## Question 3
al_df <- read.csv("aluminum_dataset.csv", encoding = "UTF - 8") %>%
  filter(loading_type == "T", temp == 20, lot == "A")
al_reg_df <- al_df %>% filter(Strain < 0.0035, Strain > 0.0001)

reg <- lm(Stress_MPa ~ 1 + Strain, data = al_reg_df) # with intersect
al_reg_df$fit1 <- reg$fitted.values
al_df %>% filter(Strain < 0.0035) %>%
  ggplot() +
  geom_point(aes(x=Strain, y=Stress_MPa, color=factor(specimen)), size = 1) +
  geom_line(aes(x=Strain, y=fit1, color="All Specimen Fitted"), lwd=2, data=al_reg_df)

reg_org <- lm(Stress_MPa ~ 0 + Strain, data = al_reg_df) # without intersect
al_reg_df$fit2 <- reg_org$fitted.values
al_df %>% filter(Strain < 0.0035) %>%
  ggplot() +
  geom_point(aes(x=Strain, y=Stress_MPa, color=factor(specimen)), size = 1) +
  geom_line(aes(x=Strain, y=fit2, color="All Specimen Fitted"), lwd=2, data=al_reg_df)

summary(reg)
summary(reg_org)




