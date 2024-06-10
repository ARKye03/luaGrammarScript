#!/usr/bin/env lua

local http = require("socket.http")
local https = require("ssl.https")
local json = require("cjson")
local ltn12 = require("ltn12")

local system_content = "You are a Interpreter and you are to fix grammar mistakes in the following text"
local user_content = arg[1]

local url = "https://api.aimlapi.com/v1/chat/completions"
local headers = {
    ["Content-Type"] = "application/json",
    ["Authorization"] = "Bearer d0e0a2b9c66449eaba13fed3fa37f7aa"
}
local body = json.encode({
    model = "gpt-4o",
    messages = {
        { role = "system", content = system_content },
        { role = "user",   content = user_content }
    },
    temperature = 0.7,
    max_tokens = 128
})

local response_body_table = {}
local response_body, response_code, response_headers, response_status = https.request {
    url = url,
    method = "POST",
    headers = headers,
    source = ltn12.source.string(body),
    sink = ltn12.sink.table(response_body_table)
}

if response_code ~= 200 and response_code ~= 201 then
    print("Error: " .. response_status)
else
    local response = json.decode(table.concat(response_body_table))
    print("AI/ML API:\n", response.choices[1].message.content)
end
