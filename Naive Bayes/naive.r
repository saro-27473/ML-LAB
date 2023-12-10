library(tm)
library(e1071)

# Sample email data and their corresponding labels (0 for spam, 1 for not spam)
emails <- c(
  "Buy cheap watches online!",
  "Congratulations, you've won a prize!",
  "Please review the attached report.",
  "Can we reschedule our meeting?",
  "Viagra for sale, limited time offer."
)

labels <- c(0, 0, 1, 1, 0)

# Split the data into training and testing sets
set.seed(42)
split_index <- sample(seq_along(emails), size = 0.8 * length(emails))
train_emails <- emails[split_index]
test_emails <- emails[-split_index]
train_labels <- labels[split_index]
test_labels <- labels[-split_index]

# Create a Corpus and DocumentTermMatrix
corpus <- Corpus(VectorSource(train_emails))
dtm <- DocumentTermMatrix(corpus)

# Convert the DocumentTermMatrix to a data frame
train_data <- as.data.frame(as.matrix(dtm))
colnames(train_data) <- make.names(colnames(train_data))

# Train a Naive Bayes classifier
nb_classifier <- naiveBayes(train_data, train_labels)

# Preprocess the test data using the same transformations
test_corpus <- Corpus(VectorSource(test_emails))
test_dtm <- DocumentTermMatrix(test_corpus, control = list(dictionary = Terms(dtm)))

# Convert the DocumentTermMatrix to a data frame
test_data <- as.data.frame(as.matrix(test_dtm))
colnames(test_data) <- make.names(colnames(test_data))

# Predict the labels for the test set
nb_predictions <- predict(nb_classifier, test_data)

# Calculate accuracy and display the confusion matrix
accuracy <- sum(nb_predictions == test_labels) / length(test_labels)
conf_matrix <- table(Predicted = nb_predictions, Actual = test_labels)

cat("Test Emails:\n")
for (i in seq_along(test_emails)) {
  email <- test_emails[i]
  true_label <- ifelse(test_labels[i] == 0, "spam", "not spam")
  cat("Email:", email, "\n")
  pred_label <- ifelse(nb_predictions[i] == 0, "spam", "not spam")
  cat("True Label:", true_label, ", Predicted Label:", pred_label, "\n\n")
}

cat("Accuracy:", accuracy, "\n")
cat("Confusion Matrix:\n", conf_matrix, "\n")
