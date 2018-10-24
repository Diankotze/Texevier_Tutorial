cl = makePSOCKcluster(10)

# I use the partial method below, otherwise it might take a
# long time to run.
portfolio_eqw <- Return.portfolio(Data_wide, weight = NULL, geometric = FALSE) 


AC = autoarfima(as.numeric(portfolio_eqw), ar.max = 2, ma.max = 2, 
                criterion = "AIC", method = "partial", arfima = FALSE, include.mean = NULL, 
                distribution.model = "norm", solver = "solnp", cluster = cl)

#show(head(AC$rank.matrix))
#This tells us what the optimal rank is(guides us)

garch11 <- ugarchspec(variance.model = list(model = c("sGARCH", 
                                                      "gjrGARCH", "eGARCH", "fGARCH", "apARCH")[1], garchOrder = c(2,2)), mean.model = list(armaOrder = c(1, 0), include.mean = TRUE), 
                      distribution.model = c("norm", "snorm", "std", "sstd", "ged", 
                                             "sged", "nig", "ghyp", "jsu")[1])


# Now to fit, I use as.matrix and the data - this way the
# plot functions we will use later will work.

garchfit1 = ugarchfit(spec = garch11, data = as.numeric(portfolio_eqw))

# Note it saved a S4 class object - having its own plots and
# functionalities:

class(garchfit1)

