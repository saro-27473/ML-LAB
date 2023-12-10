!pip install -q transformers

# Import the necessary libraries
from transformers import pipeline

# Create a sentiment analysis pipeline
sentiment_pipeline = pipeline("sentiment-analysis")

# Define the input data
# data = ["I love you", "I hate you", "I am Sad"]
while True:
  data=input("Leave a message: ")
  # Get the sentiment analysis results
  results = sentiment_pipeline(data)

  # Print the results
  for result in results:
    print(f"Label: {result['label']}, Score: {result['score']}")


