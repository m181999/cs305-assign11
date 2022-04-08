library(plotly)

USPersonalExpenditure <- data.frame("Categorie" = rownames(USPersonalExpenditure), USPersonalExpenditure)
data <- USPersonalExpenditure[, c('Categorie', 'X1960')]

colors <- c('rgb(255, 127, 0)', 'rgb(0,177,64)', 'rgb(255,0,0)', 'rgb(0,0,0)', 'rgb(187,41,187)')

fig <- plot_ly(data, labels = ~Categorie, values = ~X1960, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               showlegend = FALSE)
fig <- fig %>% layout(title = '1960 U.S. Personal Expenditures',
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

fig


