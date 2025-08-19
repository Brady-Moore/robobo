class CreateConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :conversations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :sentence_prompt
      t.text :submitted_text

      t.timestamps
    end
  end
end
