Cumulative_portfolio_eqw <-portfolio_eqw %>% 
  xts_tbl() %>% 
  mutate(portfolio.returns = coalesce(portfolio.returns, 0)) %>% 
  mutate(cumulative_ret = cumprod(1+ portfolio.returns))
