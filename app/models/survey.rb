class Survey < ApplicationRecord
  has_many  :users, class_name: "User", foreign_key: "survey_id"
  has_many :challenge_runs, through: :users, source: :challenge_runs
end
