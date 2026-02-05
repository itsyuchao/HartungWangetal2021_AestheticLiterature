
library(ggplot2)
library(jaspGraphs)
setGraphOption("palette", "colorblind")

# use colors directly
colors <- JASPcolors("colorblind")
plot(rnorm(6), col = colors, pch = 16, cex = 2)

colors <- JASPcolors("colorblind")
plot(runif(100,-1,1), col = colors, pch = 16, cex = 2)

# use a function if you want an arbitrary number of colros
colFun <- JASPcolors(palette = "colorblind", asFunction = TRUE)
plot(rnorm(10), col = colFun(10), pch = 16, cex = 2)

# use colorscales in ggplot2
e0 <- 1:10
df <- data.frame(x = e0, y = e0, z = e0, g = factor(e0))
g0 <- ggplot(df, aes(x = x, y = y, color = z, fill = z)) + geom_point(size = 5)
g1 <- ggplot(df, aes(x = x, y = y, color = g, fill = g)) + geom_point(size = 5)
g0

g1 + scale_JASPcolor_discrete() + scale_JASPfill_discrete()

# colorblind is not really suited for a continuous color scale
g0 + scale_JASPcolor_continuous() + scale_JASPfill_continuous()

# viridis already looks a lot better!
setGraphOption("palette", "viridis")
g0 + scale_JASPcolor_continuous() + scale_JASPfill_continuous()

# reset the palette to it's default if you changed it globally!
setGraphOption("palette", "colorblind")



dat <- data.frame(Row = rep(x = LETTERS[1:5], times = 2)
                  , Col = rep(x = LETTERS[1:10], each = 1)
                  , Corr = rep(x = c(-1,-0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.75, 1), times = 1))
a <- ggplot(data =  dat, aes(x = Row, y = Col, color = Corr)) + 
  geom_point() +
  scale_color_gradient2(midpoint=0, low="#800000", mid="white",
                        high="#291c63") + theme(legend.position = "right")
ggsave("legend.png", plot = a, device = png(),
       scale = 1, width = 300, height = 300, units = c("mm"),
       dpi = 300, limitsize = TRUE)
