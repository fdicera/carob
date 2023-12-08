class ChallengeRun < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  belongs_to :challenge_type, required: true, class_name: "ChallengeType", foreign_key: "challenge_type_id", counter_cache: true
  has_one  :survey, through: :user, source: :survey
end
