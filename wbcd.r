library(class)
library(gmodels)
wbcd <- read.csv("wdbc.data.csv", stringsAsFactors = FALSE)
wbcd <- wbcd[-1] #removing id column
wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B", "M"), labels = c("Benign", "Malignant"))
wbcd_z <- as.data.frame(scale(wbcd[-1])) #normalizing data z-score, without diagnosis
wbcd_train <- wbcd_z[1:469, ]
wbcd_test <- wbcd_z[470:569, ]
wbcd_train_labels <- wbcd[1:469, 1] #getting the diagnosis column for training dataset
wbcd_test_labels <- wbcd[470:569, 1]
wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=21)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)