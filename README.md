# README.md for main.lua

This is a Lua script that interacts with an AI/ML API to fix grammar mistakes in a given text.

## How it works

The script sends a POST request to the API endpoint `https://api.aimlapi.com/v1/chat/completions` with a JSON payload. The payload includes a system message, a user message, and some parameters for the AI model.

The system message is a fixed string: "You are a Interpreter and you are to fix grammar mistakes in the following text". The user message is passed as a command line argument when running the script.

The AI model used is "gpt-4o", with a temperature of 0.7 and a maximum of 128 tokens.

The response from the API is a JSON object, which is parsed and the content of the first choice message is printed to the console.

## Dependencies

The script requires the following Lua libraries:

- `socket.http` for making HTTP requests
- `ssl.https` for making HTTPS requests
- `cjson` for encoding and decoding JSON
- `ltn12` for handling the request and response bodies

## Usage

Run the script with a single argument, which is the text you want the AI to fix:

```sh
lua main.lua "your text here"
```

## Error handling

If the API request does not return a 200 or 201 status code, the script prints an error message with the response status.
