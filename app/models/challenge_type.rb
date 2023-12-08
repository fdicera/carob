# == Schema Information
#
# Table name: challenge_types
#
#  id                   :integer          not null, primary key
#  challenge_runs_count :integer
#  description          :string
#  duration             :integer
#  name                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  profile_id           :integer
#
class ChallengeType < ApplicationRecord
  belongs_to :profile, required: true, class_name: "Profile", foreign_key: "profile_id", counter_cache: true
  has_many  :challenge_runs, class_name: "ChallengeRun", foreign_key: "challenge_type_id"
end
