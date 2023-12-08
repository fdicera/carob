class CreateChallengeRuns < ActiveRecord::Migration[7.0]
  def change
    create_table :challenge_runs do |t|
      t.integer :challenge_type_id
      t.string :user_progress
      t.integer :user_id
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
