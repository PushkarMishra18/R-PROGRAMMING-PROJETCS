
install.packages("dplyr")
install.packages("ggplot2")

library(dplyr)
library(ggplot2)


set.seed(123)
data <- data.frame(
  age = sample(20:60, 100, replace = TRUE),
  income = sample(20000:100000, 100, replace = TRUE),
  loan_amount = sample(5000:50000, 100, replace = TRUE),
  default = sample(0:1, 100, replace = TRUE)
)

head(data)


set.seed(123)
train_rows <- sample(1:nrow(data), 0.7 * nrow(data))

train <- data[train_rows, ]
test <- data[-train_rows, ]


model <- glm(default ~ age + income + loan_amount, data = train, family = binomial)
summary(model)


predicted_probs <- predict(model, newdata = test, type = "response")
predicted_class <- ifelse(predicted_probs > 0.5, 1, 0)
table(Predicted = predicted_class, Actual = test$default)

install.packages("pROC")
library(pROC)
roc_obj <- roc(test$default, predicted_probs)
lot(roc_obj, main = "ROC Curve for Credit Risk Model")

accuracy <- mean(predicted_class == test$default)
print(paste("Accuracy:", round(accuracy * 100, 2), "%"))


library(ggplot2)

# Plot of predicted probabilities
ggplot(data.frame(predicted_probs), aes(x = predicted_probs)) +
  geom_histogram(binwidth = 0.05, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Predicted Probabilities",
       x = "Predicted Probability of Default",
       y = "Count") +
  theme_minimal()

