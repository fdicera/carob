class CreateChallengeTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :challenge_types do |t|
      t.integer :duration
      t.string :name
      t.integer :profile_id
      t.string :description
      t.integer :challenge_runs_count

      t.timestamps
    end
  end
end
