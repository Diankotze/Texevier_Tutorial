#Period 1

Moments_period1 <- return_stocks %>% filter(Date >= ymd(20060518) & Date < ymd(20071231)) %>% 
  group_by(Stocks) %>% 
  summarise(period1_mean = mean(Ret_stocks, na.rm = T),period1_variance = var(Ret_stocks, na.rm = T)) %>% 
  tbl_df()


#Now period 2

Moments_period2 <- return_stocks %>% filter(Date >= ymd(20100101) & Date < ymd(20121231)) %>% 
  group_by(Stocks) %>% 
  summarise(period1_mean = mean(Ret_stocks, na.rm = T),period1_variance = var(Ret_stocks, na.rm = T)) %>% 
  tbl_df()