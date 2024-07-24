install.packages("faker") 
install.packages("dplyr") 
install.packages("ggplot2") 
install.packages("lubridate")


Load Libraries
library(faker) 
library(dplyr) 
library(ggplot2) 
library(lubridate)

# Save the dataset state_trends as df
df <- customer_transactions

# show the first few lines in our Dataset 
head(df)

# Summary statistics 
summary(df)

# Check for missing values 
sum(is.na(df)) 

# Check for duplicates 
sum(duplicated(df)) 

# Display data types 
str(df)

# Transaction amount by product
ggplot(df, aes(x = Product, y = Amount)) +
  geom_boxplot(fill = 'blue', color = 'black', alpha = 0.7) +
  ggtitle('Transaction Amount Distribution by Product') +
  xlab('Product') +
  ylab('Amount')

# Transactions over time
df <- df %>% 
  mutate(YearMonth = floor_date(TransactionDate, "month"))

ggplot(df, aes(x = YearMonth)) +
  geom_bar(fill = 'blue', color = 'black', alpha = 0.7) +
  ggtitle('Number of Transactions Over Time') +
  xlab('Month') +
  ylab('Count')
