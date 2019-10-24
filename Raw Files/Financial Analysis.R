#Data ( its monthly based data)
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
# Calculate the profit 
profit<- revenue - expenses
profit

# Now get the paid taxes, which is 30 % of the profit
tax <- round(profit* 0.3 , digit = 2)
tax

profit.after.tax<- profit- tax
profit.after.tax # the negative value ofthe profit is ok , it shows loss

# So, our profit margin
profit.margin <- round(profit.after.tax / revenue , 2) *100
profit.margin

# Now let's check the analysis of data from information we get from the data
# mean profit we get annully
mean_pat <- mean(profit.after.tax)
mean_pat

# good and bad month for the company
good.month = profit.after.tax > mean_pat
good.month

bad.month <- !good.month
bad.month


# best month
best.month <- profit.after.tax == max(profit.after.tax)
best.month # last month is best 
print(max(profit.after.tax))

# Let's check the difference of profit of loss compare to main data 
temp = rep(max(profit.after.tax), 12)
diff = profit.after.tax - temp
diff

revenue.1000 <- round(revenue / 1000)
expenses.1000 <- round( expenses /1000)
profit.1000 <- round (profit /1000)
profit.after.tax.1000 <- round (profit.after.tax /1000)

Analysis.Report<- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.month,
  bad.month,
  best.month,
  diff
)

Analysis.Report
