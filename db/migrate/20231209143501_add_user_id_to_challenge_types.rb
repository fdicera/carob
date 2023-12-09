class AddUserIdToChallengeTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :challenge_types, :user_id, :integer
    add_index :challenge_types, :user_id
  end
end
