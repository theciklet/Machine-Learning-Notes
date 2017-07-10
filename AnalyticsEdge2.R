#let's see which row is giving us max sodium level and find the description of it
which.max(usda$Sodium)
usda$Description[which.max(usda$Sodium)] # or we could use output of previous code

#create sodium content subset data frame
HighSodium = subset(usda, Sodium >10000)
HighSodium$Description

#let's find a word "CAVIAR" in description column and then find the sodium level

match("CAVIAR", usda$Description) # output is 4154

usda$Sodium[4154] # which sodium level is 1500

# or we can use 
usda$Sodium[match("CAVIAR", usda$Description)]

#mean and sd of sodium level

mean(usda$Sodium, na.rm = TRUE)
sd(usda$Sodium, na.rm = TRUE)
 
#ploting

plot(usda$Protein, usda$TotalFat, xlab= "Protein", ylab="Fat", main = "Protein vs Fat", col = "red")
hist(usda$VitaminC, xlab= "VitaminC", ylab="Frequency", main = "Vitamin C by Frequency", xlim = c(0,100), breaks = 2000)
boxplot(usda$Sugar, main= "Sugar levels", ylab= "Sugar(g)")

#create a another variable(column) from existing variables

usda$HighSodium = as.numeric(usda$Sodium > mean(usda$Sodium, na.rm = TRUE))
usda$highProtein = as.numeric(usda$Protein > mean(usda$Protein, na.rm = TRUE))
usda$highFat = as.numeric(usda$TotalFat > mean(usda$TotalFat, na.rm = TRUE))
usda$highCarbohydrate = as.numeric(usda$Carbohydrate > mean(usda$Carbohydrate, na.rm = TRUE))
str(usda)

#see high sodium and Fat

table(usda$highFat, usda$HighSodium)

#using tapply function to compute the average amount of iron, sorted by high and low protein

tapply(usda$Iron, usda$highProtein, mean, na.rm=TRUE)
tapply(usda$VitaminC, usda$highCarbohydrate, summary, na.rm=TRUE)


