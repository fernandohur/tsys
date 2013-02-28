module SourcesHelper

  def render_source(source)
    render :partial => "sources/source_partial" , :locals => {:source=>source}
  end

end
