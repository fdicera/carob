class AddUserIdToSurveys < ActiveRecord::Migration[7.0]
  def change
    add_column :surveys, :user_id, :integer
    add_index :surveys, :user_id
  end
end
