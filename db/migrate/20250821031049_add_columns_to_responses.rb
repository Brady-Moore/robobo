class AddColumnsToResponses < ActiveRecord::Migration[7.1]
  def change
    add_column :responses, :model_id, :string
    add_column :responses, :input_tokens, :integer
    add_column :responses, :output_tokens, :integer
    add_reference :responses, :tool_call, foreign_key: true
  end
end
