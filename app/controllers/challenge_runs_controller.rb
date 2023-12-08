class ChallengeRunsController < ApplicationController
  def index
    matching_challenge_runs = ChallengeRun.all

    @list_of_challenge_runs = matching_challenge_runs.order({ :created_at => :desc })

    render({ :template => "challenge_runs/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_challenge_runs = ChallengeRun.where({ :id => the_id })

    @the_challenge_run = matching_challenge_runs.at(0)

    render({ :template => "challenge_runs/show" })
  end

  def create
    the_challenge_run = ChallengeRun.new
    the_challenge_run.challenge_type_id = params.fetch("query_challenge_type_id")
    the_challenge_run.user_progress = params.fetch("query_user_progress")
    the_challenge_run.user_id = params.fetch("query_user_id")
    the_challenge_run.end_date = params.fetch("query_end_date")
    the_challenge_run.status = params.fetch("query_status")

    if the_challenge_run.valid?
      the_challenge_run.save
      redirect_to("/challenge_runs", { :notice => "Challenge run created successfully." })
    else
      redirect_to("/challenge_runs", { :alert => the_challenge_run.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_challenge_run = ChallengeRun.where({ :id => the_id }).at(0)

    the_challenge_run.challenge_type_id = params.fetch("query_challenge_type_id")
    the_challenge_run.user_progress = params.fetch("query_user_progress")
    the_challenge_run.user_id = params.fetch("query_user_id")
    the_challenge_run.end_date = params.fetch("query_end_date")
    the_challenge_run.status = params.fetch("query_status")

    if the_challenge_run.valid?
      the_challenge_run.save
      redirect_to("/challenge_runs/#{the_challenge_run.id}", { :notice => "Challenge run updated successfully."} )
    else
      redirect_to("/challenge_runs/#{the_challenge_run.id}", { :alert => the_challenge_run.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_challenge_run = ChallengeRun.where({ :id => the_id }).at(0)

    the_challenge_run.destroy

    redirect_to("/challenge_runs", { :notice => "Challenge run deleted successfully."} )
  end
end
