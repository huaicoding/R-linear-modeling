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