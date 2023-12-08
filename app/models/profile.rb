class Profile < ApplicationRecord
  has_many  :users, class_name: "User", foreign_key: "profile_id"
  has_many  :challenge_types, class_name: "ChallengeType", foreign_key: "profile_id"
end
