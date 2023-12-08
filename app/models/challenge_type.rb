class ChallengeType < ApplicationRecord
  belongs_to :profile, required: true, class_name: "Profile", foreign_key: "profile_id", counter_cache: true
  has_many  :challenge_runs, class_name: "ChallengeRun", foreign_key: "challenge_type_id"
end
