# == Schema Information
#
# Table name: surveys
#
#  id                        :integer          not null, primary key
#  expenses                  :string
#  goal_target_date          :date
#  income                    :string
#  investment_recommendation :string
#  risk_tolerance            :string
#  savings_goal              :string
#  savings_recommendation    :string
#  score                     :string
#  users_count               :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
class Survey < ApplicationRecord
  has_many  :users, class_name: "User", foreign_key: "survey_id"
  has_many :challenge_runs, through: :users, source: :challenge_runs
  has_one :challenge_type
end
