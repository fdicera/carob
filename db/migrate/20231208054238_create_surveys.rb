class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.string :income
      t.string :expenses
      t.string :score
      t.string :risk_tolerance
      t.string :savings_goal
      t.date :goal_target_date
      t.string :savings_recommendation
      t.string :investment_recommendation
      t.integer :users_count

      t.timestamps
    end
  end
end
