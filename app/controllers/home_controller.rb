class HomeController < ApplicationController
  def toggle_pc_view
    if cookies[:force_pc_view] == 't'
      cookies.delete(:force_pc_view)
    else
      cookies[:force_pc_view] = 't'
    end

	if params['current_path']
    redirect_to params['current_path']
	else
    redirect_to '/' 
	end
  end

end
