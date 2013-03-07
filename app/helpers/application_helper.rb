module ApplicationHelper

  def render_title(title, subtitle)
    render :partial => "partials/legend", :locals => {:title=>title, :subtitle=>subtitle}
  end

  def url_starts_with(request, str)
    if request.fullpath.start_with?"#{str}"
      render :inline=> 'class="active"'
    end
  end


end
