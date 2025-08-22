class AiMessageService
  def initialize(response)
    @response = response
  end

  def call
    # call the ai and create the message here
    prompt = @response.build_prompt
    @response.chat.with_instructions(prompt).ask(@response.content)
  end
end