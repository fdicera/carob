class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :description
      t.integer :user_id
      t.string :profile_name
      t.integer :users_count
      t.integer :challenge_types_count

      t.timestamps
    end
  end
end
