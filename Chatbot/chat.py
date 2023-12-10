import random

# Define a dictionary of responses
responses = {
    "hello": "Hello! How can I assist you?",
    "how are you": "I'm just a chatbot, but thanks for asking!",
    "bye": "Goodbye! Have a great day.",
    "faculty name": "Ramya mam",
    "boomer": "That's my friend Baranidharan",
    "tell a joke": "Why did the computer keep freezing? Because it left its Windows open!",
    "favorite color": "I'm just a chatbot, so I don't have a favorite color.",
    "age": "I don't age like humans, I'm always up-to-date!",
    "default": "I'm not sure how to respond to that."
}

# Function to generate responses
def get_response(user_input):
    user_input = user_input.lower()
    response = responses.get(user_input, responses["default"])
    return response

# Chatbot interaction loop
print("Chatbot: Hello! Type 'bye' to exit.")
while True:
    user_input = input("You: ")
    if user_input == "bye":
        print("Chatbot: Goodbye!")
        break
    response = get_response(user_input)
    print(f"Chatbot: {response}")
