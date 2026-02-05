library(readxl)
EmoEventRating <- read_excel("~/Desktop/EventRatingOnly.xlsx")
str(EmoEventRating)
median(EmoEventRating$MN_event[EmoEventRating$story == "emoDMO"])
median(EmoEventRating$MN_event[EmoEventRating$story == "emoDM2V"])
median(EmoEventRating$MN_event[EmoEventRating$story == "emoDHO"])
median(EmoEventRating$MN_event[EmoEventRating$story == "emoDH2V"])

for (i in 1:nrow(EmoEventRating)) {
  if (EmoEventRating$MN_event[i] <= 4) {
    EmoEventRating$MN_event[i] <- NA 
  }
}

EmoEventRating <- EmoEventRating[complete.cases(EmoEventRating),]
write.csv(EmoEventRating, file = "~/Documents/GitHub/RStudio/thesis/EmoEventRating>4.csv", row.names = FALSE)

LitEventRating <- read_excel("~/Desktop/LitEventRatingOnly.xlsx")
str(LitEventRating)
median(LitEventRating$MN_event[LitEventRating$story == "litDMO"])
median(LitEventRating$MN_event[LitEventRating$story == "litDM2V"])
median(LitEventRating$MN_event[LitEventRating$story == "litDHO"])
median(LitEventRating$MN_event[LitEventRating$story == "litDH2V"])
mean(LitEventRating$MN_event[LitEventRating$story == "litDMO"])
mean(LitEventRating$MN_event[LitEventRating$story == "litDM2V"])
mean(LitEventRating$MN_event[LitEventRating$story == "litDHO"])
mean(LitEventRating$MN_event[LitEventRating$story == "litDH2V"])

for (i in 1:nrow(LitEventRating)) {
  if (LitEventRating$MN_event[i] <= 1.5) {
    LitEventRating$MN_event[i] <- NA 
  }
}

LitEventRating <- LitEventRating[complete.cases(LitEventRating),]
write.csv(LitEventRating, file = "~/Documents/GitHub/RStudio/thesis/LitEventRating>1pt5.csv", row.names = FALSE)
