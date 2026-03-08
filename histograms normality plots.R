library(sjPlot) # for drawing histogram
library(ggplot2)
library(wakefield) # for creating sample data
df <- data.frame(patID = wakefield::id(10000),
                    age = wakefield::age(10000),
                    height = wakefield::height_cm(10000))

df
head(df)
sjPlot::plot_frq(df$height, type = 'h')


# adjustbin width
sjPlot::plot_frq(df$height, type = 'histogram',
                             geom.size = 2)

# change fill colour
sjPlot::plot_frq(df$height, type = 'h',
                             geom.colors = 'red')

# show mean,sd
sjPlot::plot_frq(df$height, type = 'h',
                            show.mean = TRUE)

# add a normal curve
sjPlot::plot_frq(df$Zn, type = 'h',
                 show.mean = TRUE,
                 normal.curve = TRUE,
                 normal.curve.color = 'red',
                 normal.curve.size = 2,
                 normal.curve.alpha = 0.99,)


# add a normal curve
sjPlot::plot_frq(df$height, type = 'h',
                 show.mean = TRUE,
                 normal.curve = TRUE,
                 normal.curve.color = 'red',
                 normal.curve.size = 1,
                 normal.curve.alpha = 0.99,
                 show.sd = TRUE,
                 show.mean.val = TRUE,
                 mean.line.size = 1
                 )

pl <- sjPlot::plot_frq(df$height, type = 'h',
                 show.mean = TRUE,
                 normal.curve = TRUE,
                 normal.curve.color = 'red',
                 normal.curve.size = 1,
                 normal.curve.alpha = 0.99,
                 show.sd = TRUE,
                 show.mean.val = TRUE,
                 mean.line.size = 1
)


# enhance chart further

pl <- plot_frq(df$height, type = 'h',
                       show.mean = TRUE,
                       show.mean.val = TRUE,
                       normal.curve = TRUE,
                       show.sd = TRUE,
                       normal.curve.color = 'red',
                       normal.curve.size = 1,
                       mean.line.size = 1)
                    


