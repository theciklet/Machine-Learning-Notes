#let's see which row is giving us max sodium level and find the description of it
which.max(usda$Sodium)
usda$Description[which.max(usda$Sodium)] # or we could use output of previous code


