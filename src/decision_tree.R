# decision_tree.R
# Classification Decision Tree using rpart
# Author: Julia Johnson
# Description: Builds and evaluates a decision tree on the Iris dataset

# 🧹 Load Libraries
library(rpart)
library(rpart.plot)

# 📊 Load and Prepare Data
data(iris)
set.seed(42)

# Shuffle and split dataset (70% train, 30% test)
sample_index <- sample(1:nrow(iris), size = 0.7 * nrow(iris))
train_data <- iris[sample_index, ]
test_data <- iris[-sample_index, ]

# 🌳 Train Decision Tree Model
tree_model <- rpart(Species ~ ., data = train_data, method = "class")

# 📈 Visualize Tree
rpart.plot(tree_model, type = 3, extra = 104, fallen.leaves = TRUE,
           main = "Decision Tree for Iris Dataset")

# ✅ Evaluate Model
predictions <- predict(tree_model, newdata = test_data, type = "class")
confusion_matrix <- table(test_data$Species, predictions)

# 🧮 Accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
cat("Confusion Matrix:\n")
print(confusion_matrix)
cat(sprintf("Accuracy: %.2f%%\n", accuracy * 100))
