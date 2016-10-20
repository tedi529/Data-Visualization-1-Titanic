# Student: Teodora Latinska
# Course: Foundations of Data Science
# Exercise: Titanic for Data visualization with ggplot2


#Install ggplot2 into R
install.packages("ggplot2")

#Install digest into R
install.packages("digest")

#Load ggplot2, digest, tidyr, and dplyr into workspace
library("ggplot2")
library("digest")
library("tidyr")
library("dplyr")

# Check out the structure of titanic
str(titanic)

#Remove values where pclass is NA
titanic <- titanic %>% drop_na(pclass)

# Use ggplot2 to look at distribution of sexes within classes of ship
ggplot(titanic, aes(x = factor(pclass), fill = factor(sex))) + geom_bar(position = "dodge")


# Use ggplot2 to look at distribution of survivors by sex within classes
ggplot(titanic, aes(x = factor(pclass), fill = factor(sex))) + geom_bar(position = "dodge") + 
  facet_grid(.~survived)

# Position jitter for a better visualization of the distribution
posn.j <- position_jitter(0.5, 0)

# Use ggplot2 to look at age distribution of survivors by sex within classes
ggplot(titanic, aes(x = factor(pclass), y = age, col = factor(sex))) + facet_grid(.~survived) + geom_jitter(size = 3,
                                                                                                            alpha = 0.5, position = posn.j)
# Note: R removed 263 with missing age values