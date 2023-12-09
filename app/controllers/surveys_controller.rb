class SurveysController < ApplicationController
  def index
    matching_surveys = Survey.where({ :user_id => current_user.id })

    @list_of_surveys = matching_surveys.order({ :created_at => :desc})

    render({ :template => "surveys/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_surveys = Survey.where({ :id => the_id })

    @the_survey = matching_surveys.at(0)

    render({ :template => "surveys/show" })
  end

  def create
    the_survey = Survey.new
    the_survey.income = params.fetch("query_income")
    the_survey.expenses = params.fetch("query_expenses")
    #the_survey.score = params.fetch("query_score")
    the_survey.risk_tolerance = params.fetch("query_risk_tolerance")
    the_survey.user_id = current_user.id
   # the_survey.savings_goal = params.fetch("query_savings_goal")
    #the_survey.goal_target_date = params.fetch("query_goal_target_date")
    #the_survey.savings_recommendation = params.fetch("query_savings_recommendation")
   # the_survey.investment_recommendation = params.fetch("query_investment_recommendation")
   # the_survey.users_count = params.fetch("query_users_count")

    if the_survey.valid?
      the_survey.save
      calculate_score_and_create_challenge(the_survey)
      redirect_to("/surveys", { :notice => "Survey created successfully." })
      # Redirect to the challenge_runs page
    #redirect_to("/s")
    else
      redirect_to("/surveys", { :alert => the_survey.errors.full_messages.to_sentence })
    end
  end

  def calculate_score_and_create_challenge(the_survey)
    income = the_survey.income.to_i
    expenses = the_survey.expenses.to_i
    risk_tolerance = the_survey.risk_tolerance.to_i
  
    score = ((income - expenses)/ income) * risk_tolerance * 10

    challenge_description = determine_challenge(score)

   # Create ChallengeType and log the result
   challenge_type = ChallengeType.create({
    :survey_id => the_survey.id,
    :description => challenge_description
  })

  if challenge_type.persisted?
    Rails.logger.info "ChallengeType created: #{challenge_type.inspect}"
  else
    Rails.logger.warn "Failed to create ChallengeType: #{challenge_type.errors.full_messages.join(', ')}"
  end
end
  
  def determine_challenge(score)
    if score < 2
      "Invest 10% of net income in fixed income."
    elsif score >= 2 && score < 6
      "Invest 5% of net income in equities, 5% in fixed income."
    else
      "Invest 10% of net income in equities."
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_survey = Survey.where({ :id => the_id }).at(0)

    the_survey.income = params.fetch("query_income")
    the_survey.expenses = params.fetch("query_expenses")
    the_survey.risk_tolerance = params.fetch("query_risk_tolerance")

    if the_survey.valid?
      the_survey.save
      redirect_to("/surveys", { :notice => "Survey updated successfully."} )
    else
      redirect_to("/surveys/#{the_survey.id}", { :alert => the_survey.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_survey = Survey.where({ :id => the_id }).at(0)

    the_survey.destroy

    redirect_to("/surveys", { :notice => "Survey deleted successfully."} )
  end
end
