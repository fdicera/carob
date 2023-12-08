# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  avatar                 :string
#  challenge_runs_count   :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  profile_id             :integer
#  survey_id              :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  #direct associations
  #has_many  :challenge_runs, class_name: "ChallengeRun", foreign_key: "user_id"
 #belongs_to :profile, required: true, class_name: "Profile", foreign_key: "profile_id", counter_cache: true
 # belongs_to :survey, required: true, class_name: "Survey", foreign_key: "survey_id", counter_cache: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
