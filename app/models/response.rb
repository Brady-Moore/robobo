class Response < ApplicationRecord
  acts_as_message
  # enum role: {system: 0, user: 1, assistant: 2}
  # scope :displayable, -> {where(role: [:user, :assistant])}
  belongs_to :conversation

  def chat
    self.conversation
  end

  def message
    self
  end

  def build_prompt
     <<-PROMPT
        Rules by Level:
        N5
        Sentence meaning in English
        Word breakdown: hiragana only (no kanji) + short meaning
        Particles explained very simply
        N4
        Sentence meaning in English
        Word breakdown: hiragana + basic N4 kanji + short meaning
        Particles explained simply
        N3
        Sentence meaning in English
        Word breakdown: hiragana + N3 kanji and below + short meaning
        Particles explained a bit deeper
        N2
        Sentence meaning in English
        Word breakdown: hiragana + N2 kanji and below + short meaning
        Particles explained concisely, with nuance
        N1
        Sentence meaning in English
        Word breakdown: word with furigana + short meaning
        Particles explained with precise nuance (still short)
        Additional rules :
        No need for sentence furigana.
        Keep particle explanations very short (1 phrase).
        For higher levels, you can ignore obvious words (e.g., 日本).
        The user JLPT is #{conversation.user.jlpt_level}
        GIve me your answer in this format:
        Sentence meaning → simple English translation
        Word breakdown → word = short English meaning
        Explain particle → particle = short function
      PROMPT
  end
end
