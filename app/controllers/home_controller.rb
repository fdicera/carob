class HomeController < ApplicationController

  def show

    if current_user.survey_id.at(0) == nil
      redirect_to("/surveys")
    else
      redirect_to("/challenge_types")
    end
  end
  
end
