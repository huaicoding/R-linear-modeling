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

