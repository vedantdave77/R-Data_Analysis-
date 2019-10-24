# IMPORT THE DATA SET
mov <- read.csv('Section6-Homework-Data.csv')

# EXPLORE THE DATA 
head(mov)
tail(mov)
summary(mov)
str(mov)

#GGPLOT INSTALATION 
install.packages('ggplot2')
library(ggplot2)

# release date of movies
ggplot(data = mov ,aes( x = Day.of.Week) )+ geom_bar() 


# filter the dataset as per the final requirement.

# first, we seperate require Gerne (just 5 / 15)
levels(mov$Genre)
filt1 <- mov$Genre %in% c('action', 'adventure', 'drama', 'comedy', 'animation')
filt1

# Secondly, we require only 6/36 studio .
levels(mov$Studio)
filt2 <- mov$Studio %in% c('Buena Vista Studios', 'Fax', 'WB', 'Sony', 'Paramount Pictures', 'Universal')
filt2

#Finalize the data according to requirement...
movf <- mov[filt1 & filt2, ]
movf

#...Expore it
head(movf)
summary(movf)
tail(movf)
str(movf)

levels(movf$Genre)
# Layered ggplot visulization
m <- ggplot(data = movf, aes( x = Genre, y = Gross...US)) 
f<- m + 
  geom_jitter(aes(size = Budget...mill., colour = Studio))+
  geom_boxplot(alpha = 0.6, outlier.colour = NA )
  
t<- f + 
  xlab('Genre')+
  ylab('Gross%US')+
  ggtitle('Domestic Gross % by Genre')
t

t <- t+
  theme(axis.title.x = element_text(colour = 'blue', size = 15),
  axis.title.y = element_text(colour = 'blue', size = 15),
  axis.text.x = element_text(colour = 'blue', size = 12),
  axis.text.y = element_text(colour = 'blue', size = 12),
  
  plot.title = element_text(size =30 , family = 'Comic Sans MS'),
  
  legend.title = element_text(size = 15), 
  legend.text = element_text (size = 15),
  
  text = element_text(family = 'Comic Sans MS')
  )

t$labels$size <- 'Budget $M'


#.......this is the final presentation.
