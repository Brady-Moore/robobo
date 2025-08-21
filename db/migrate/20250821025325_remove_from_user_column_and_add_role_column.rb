class RemoveFromUserColumnAndAddRoleColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :responses, :from_user, :boolean

    add_column :responses, :role, :string
  end
end
