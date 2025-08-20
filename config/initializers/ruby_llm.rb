RubyLLM.configure do |config|
  # If we implement the usage of pdf files please uncomment the line of code below
  # config.gemini_api_key = ENV["GEMINI_API_KEY"]
  config.openai_api_key = ENV["GITHUB_TOKEN"]
  config.openai_api_base = "https://models.inference.ai.azure.com"
end