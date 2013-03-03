module ApplicationHelper

  def render_title(title, subtitle)
    render :partial => "partials/legend", :locals => {:title=>title, :subtitle=>subtitle}
  end



end
