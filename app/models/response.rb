class Response < ApplicationRecord
  acts_as_message

  belongs_to :conversation

  validates :content, length: { maximum: 10000 }

  def chat
    self.conversation
  end

  def message
    self
  end

  def build_prompt
     <<-PROMPT
        - your task is to act like a dictionary.
        - the user's Japanese level is #{conversation.user.jlpt_level}
        - for each user's Japanese level you will answer differently
        - N5:
        just english sentence meaning
        For word breakdown in just in hiragana(no kanji) and english explanation(short)
        - N4:
        just english sentence meaning
        For word breakdown in just in hiragana and Kanji from N4 and english explanation(short)
        - N3:
        just english sentence meaning
        For word breakdown in just in hiragana and kanji from N3 below and english explanation(short)
        N2:
        just english sentence meaning
        Word breakdown with hiragana and kanji N2 below english explanation(short)
        - N1:
        just english sentence meaning
        Word breakdown with furigana and english explanation(short)
        - Word breakdown in kanji according to JLPT level (ignore some words depending on the level)
        - explain particle（N5 to N1）
        - No need to sentence furigana
        - depending on the JLPT level there is some words you can ignore (日本 for higher level Japanese speaker)
      PROMPT
  end
end
