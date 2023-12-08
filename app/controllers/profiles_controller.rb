class ProfilesController < ApplicationController
  def index
    matching_profiles = Profile.all

    @list_of_profiles = matching_profiles.order({ :created_at => :desc })

    render({ :template => "profiles/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_profiles = Profile.where({ :id => the_id })

    @the_profile = matching_profiles.at(0)

    render({ :template => "profiles/show" })
  end

  def create
    the_profile = Profile.new
    the_profile.description = params.fetch("query_description")
    the_profile.user_id = params.fetch("query_user_id")
    the_profile.profile_name = params.fetch("query_profile_name")
    the_profile.users_count = params.fetch("query_users_count")
    the_profile.challenge_types_count = params.fetch("query_challenge_types_count")

    if the_profile.valid?
      the_profile.save
      redirect_to("/profiles", { :notice => "Profile created successfully." })
    else
      redirect_to("/profiles", { :alert => the_profile.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_profile = Profile.where({ :id => the_id }).at(0)

    the_profile.description = params.fetch("query_description")
    the_profile.user_id = params.fetch("query_user_id")
    the_profile.profile_name = params.fetch("query_profile_name")
    the_profile.users_count = params.fetch("query_users_count")
    the_profile.challenge_types_count = params.fetch("query_challenge_types_count")

    if the_profile.valid?
      the_profile.save
      redirect_to("/profiles/#{the_profile.id}", { :notice => "Profile updated successfully."} )
    else
      redirect_to("/profiles/#{the_profile.id}", { :alert => the_profile.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_profile = Profile.where({ :id => the_id }).at(0)

    the_profile.destroy

    redirect_to("/profiles", { :notice => "Profile deleted successfully."} )
  end
end
