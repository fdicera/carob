# == Schema Information
#
# Table name: profiles
#
#  id                    :integer          not null, primary key
#  challenge_types_count :integer
#  description           :string
#  profile_name          :string
#  users_count           :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#
class Profile < ApplicationRecord
  has_many  :users, class_name: "User", foreign_key: "profile_id"
  has_many  :challenge_types, class_name: "ChallengeType", foreign_key: "profile_id"
end
