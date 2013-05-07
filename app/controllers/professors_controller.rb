class ProfessorsController < ApplicationController
  def me

    if is_prof
      user_id = get_user_id()
      @professor = Professor.find(user_id)
    else
      send_home_with_flash 'not signed in as a professor'
    end

  end
end
