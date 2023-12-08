class ChallengeTypesController < ApplicationController
  def index
    matching_challenge_types = ChallengeType.all

    @list_of_challenge_types = matching_challenge_types.order({ :created_at => :desc })

    render({ :template => "challenge_types/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_challenge_types = ChallengeType.where({ :id => the_id })

    @the_challenge_type = matching_challenge_types.at(0)

    render({ :template => "challenge_types/show" })
  end

  def create
    the_challenge_type = ChallengeType.new
    the_challenge_type.duration = params.fetch("query_duration")
    the_challenge_type.name = params.fetch("query_name")
    the_challenge_type.profile_id = params.fetch("query_profile_id")
    the_challenge_type.description = params.fetch("query_description")
    the_challenge_type.challenge_runs_count = params.fetch("query_challenge_runs_count")

    if the_challenge_type.valid?
      the_challenge_type.save
      redirect_to("/challenge_types", { :notice => "Challenge type created successfully." })
    else
      redirect_to("/challenge_types", { :alert => the_challenge_type.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_challenge_type = ChallengeType.where({ :id => the_id }).at(0)

    the_challenge_type.duration = params.fetch("query_duration")
    the_challenge_type.name = params.fetch("query_name")
    the_challenge_type.profile_id = params.fetch("query_profile_id")
    the_challenge_type.description = params.fetch("query_description")
    the_challenge_type.challenge_runs_count = params.fetch("query_challenge_runs_count")

    if the_challenge_type.valid?
      the_challenge_type.save
      redirect_to("/challenge_types/#{the_challenge_type.id}", { :notice => "Challenge type updated successfully."} )
    else
      redirect_to("/challenge_types/#{the_challenge_type.id}", { :alert => the_challenge_type.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_challenge_type = ChallengeType.where({ :id => the_id }).at(0)

    the_challenge_type.destroy

    redirect_to("/challenge_types", { :notice => "Challenge type deleted successfully."} )
  end
end
