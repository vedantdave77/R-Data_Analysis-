 # Advanced Vizulization (GGPlot2)
getwd()
setwd('/Users/HP/Downloads')
getwd()
movies<-read.csv('P2-Movie-Ratings.csv')
head(movies)
colnames(movies)<- c('Film', 'Genre', 'CriticRating', 'AudienceRating','BudgetMillions','Year')
head(movies)
tail(movies)
str(movies)
summary(movies)
levels(movies$Genre)

factor(movies$Year) # No need of years as numerical number so its bettr to convert to characters.   
movies$Year <- factor(movies$Year)

summary(movies)
str(movies)

# Asthetics (with layering with every line by using '+') (aes())
install.packages('ggplot2')
library(ggplot2)

ggplot(data= movies ,aes (x= CriticRating, y= AudienceRating))+ geom_point()

# Add colour
ggplot(data= movies ,aes (x= CriticRating, y= AudienceRating, colour = Genre))+ geom_point()

# Add size 
ggplot(data= movies ,aes (x= CriticRating, y= AudienceRating, colour = Genre, size = Genre))+ geom_point()

# Add size in better way 
ggplot(data= movies ,aes (x= CriticRating, y= AudienceRating, colour = Genre, size = BudgetMillions))+ geom_point()

# Assiging the common first part
q <- ggplot(data= movies ,aes (x= CriticRating, y= AudienceRating, colour = Genre, size = BudgetMillions))

#Add geom layer
q + geom_point()

# overriding aes
q + geom_point(aes(size= CriticRating))
q + geom_point(aes(size= BudgetMillions))
q+ geom_point(aes(x= BudgetMillions)) #but here in the vizulization y label does not change so
q  + geom_point(aes(x= BudgetMillions)) + xlab('Budget in millions')

# line graph
 q+ geom_line() + geom_point()
#reduce the line width
 q + geom_line(size = 0.1) + geom_point()
 
 
 # Mapping vs Setting (beside wirte in aes() you can write directly in () , but not seperated by the )
 r <- ggplot(data = movies, aes(x= CriticRating , y = AudienceRating))
 
# ERROR : r+ geom_point(aes(size= BudgetMillions, colour = 'blue'))
 
#Histogram and Density Charts 
s <- ggplot(data= movies, aes(x= BudgetMillions))
s + geom_histogram(binwidth=10)

#add colour
s + geom_histogram(binwidth=10 ,aes(fill = Genre))

# add border
s + geom_histogram(binwidth=10 ,aes(fill = Genre), colour = 'Black')

#Density charts
 s + geom_density(aes(fill= Genre), colour = 'Black')

 # Statistical Transformation
v <- ggplot(data = movies, aes(x= Genre, y= CriticRating, colour = Genre))
v + geom_boxplot(size= 1, fill = 'White', alpha =0.5 ) + geom_jitter()

#Using Facet
w <- ggplot(data = movies, aes(x= BudgetMillions))
w + geom_histogram(binwidth= 10, aes(fill= Genre), colour= 'Black') + 
        facet_grid(Genre~.)

# stringr package required...
install.packages("stringr", dependencies=TRUE, INSTALL_opts = c('--no-lock'))
library('stringr')

summary(movies)
# Coordinates
#.........it can be done by two methods 1) limit  2) zoom
j <- ggplot(data = movies , aes(x= CriticRating, y= AudienceRating, size = BudgetMillions, colour = Genre))

# limit
j + geom_point() + xlim(50,100) + ylim(50,100)  #Actully, it cut the external data

# zoom
k <- j + geom_point() + coord_cartesian(xlim = c(50,100) , ylim = c(50,100) )
#it has continuous data so one of the part is zoomed according to the instruction.

# Themes
k +
        geom_histogram(binwidth = 10 , colour = 'Black', aes(fill = Genre , alpha = 1) ) +
        xlab('Money Axis') + 
        ylab('Number of Movies')+
        theme(axis.title.x = element_text(colour= 'DarkGreen', size = 20),
              axis.title.y = element_text(colour= 'Red', size = 20),
              axis.text.x = element_text(size= 15),
              axis.text.y = element_text(size= 15),
              
              legend.text = element_text(size = 15),
              legend.title = element_text(size = 15),
              legend.position = c(1,1),
              legend.justification = c(1,1),
              legend.background = element_rect(colour = 'yellow', 
                                   fill = 'purple', 
                                   size = 1, 
                                   linetype='dashed'),
                                 
              plot.background = element_rect(colour = 'green', 
                                             fill = 'pink', 
                                             size = 1, 
                                             linetype='dashed'),
              plot.title = element_text(colour = 'Darkblue', 
                                        size= 25,
                                        family = 'Courier')
        )
 