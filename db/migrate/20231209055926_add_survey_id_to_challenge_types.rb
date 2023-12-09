class AddSurveyIdToChallengeTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :challenge_types, :survey_id, :integer
  end
end
