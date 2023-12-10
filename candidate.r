library(dplyr)

# Load your dataset
data<- read.csv("C:\Users\cse\Desktop\mern\New folder\New folder\candydata.csv")

num_features<- ncol(data) - 1  # Exclude the class column
general_boundary<- rep("?", num_features)
specific_boundary<- rep("Ø", num_features)

# Iterate through examples
for (i in1:nrow(data)) {
  example<- data[i, ]
  class_label<- example$Outcome  # Replace with the actual target column name
  
  if (class_label == 1) {
    # Update specific boundary for positive example
    for (j in1:num_features) {
      if (specific_boundary[j] != example[j]) {
        specific_boundary[j] <- "?"
      }
    }
  } else {
    # Update general boundary for negative example
    for (j in1:num_features) {
      if (specific_boundary[j] == "?") {
        general_boundary[j] <- example[j]
      }
    }
  }
cat("Iteration",i,"\n")
final_specific_boundary<- paste(specific_boundary, collapse = ", ")
final_general_boundary<- paste(general_boundary, collapse = ", ")

# Print final boundaries
cat("Final Specific Boundary:", final_specific_boundary, "\n")
cat("Final General Boundary:", final_general_boundary, "\n")
}
