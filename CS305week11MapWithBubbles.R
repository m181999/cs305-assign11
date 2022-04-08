library(plotly)
df <- read.csv('/Users/michellemeyers/Desktop/CS305/us2021census.csv')
head(df)

g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray85"),
  subunitwidth = 1,
  countrywidth = 1,
  subunitcolor = toRGB("white"),
  countrycolor = toRGB("white")
)

fig <- plot_geo(df, locationmode = 'State', sizes = c(1, 250))
fig <- fig %>% add_markers(
  x = ~Longitude, y = ~Latitude, size = ~Population, color = ~Population, hoverinfo = "text",
  text = ~paste(df$Counties, " ")
)
fig <- fig %>% layout(title = '2020 Population from Census', geo = g)

fig