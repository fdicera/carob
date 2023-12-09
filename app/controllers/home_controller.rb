class HomeController < ApplicationController

  #def show
   # if current_user.id == nil
    #  redirect_to("/surveys")
    #else
    #  redirect_to("/challenge_types")
    #end
  #end
  
  render({ :template => "home/show" })

end
