class ToolCall < ApplicationRecord
  acts_as_tool_call

  belongs_to :message, class_name: "Response", foreign_key: :response_id
end
