return_stocks <- tidy %>% 
  group_by(Stocks) %>% 
  mutate(Ret_stocks = values/lag(values) -1) %>% 
  mutate(LogRet_stocks = log(1 + Ret_stocks/100)*100)
  
Data_wide <- 
  subset(return_stocks, select = -c(values, Ret_stocks)) %>% 
  spread(key = Stocks, value = LogRet_stocks) %>% 
  tbl_xts()

Data_wide <- na.omit(Data_wide)
