class CreateResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :responses do |t|
      t.references :conversation, null: false, foreign_key: true
      t.text :content
      t.boolean :from_user

      t.timestamps
    end
  end
end
