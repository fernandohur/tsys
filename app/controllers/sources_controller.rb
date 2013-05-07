class SourcesController < ApplicationController

  def index
    sort_by = params[:sortby]
    order = params[:order]
    filter = params[:filter]
    if sort_by
      @sources = Source.order(sort_by << " " << order)
    elsif filter
      @sources = Source.where("category LIKE '%#{filter}%'")
    else
      @sources = Source.all
    end

  end

  def show
    @source = Source.find(params[:id])
  end

  def new
    if session[:user_type]=="student"
      @source = Source.new
    else
      not_type
    end
  end

  def create
    if session[:user_type]=="student"
    @source = Source.new

    @source.descripccion = params[:descripccion]
    @source.name = params[:name]
    @source.thesis_id = params[:thesis_id]
    @source.category = params[:category]

    uploaded_io = params[:dataFile]

    path = Rails.root.join('public', 'uploads', uploaded_io.original_filename);
    File.open(path, 'w:ASCII-8BIT') do |file|
      file.write(uploaded_io.read)

    end
    realPath = File.absolute_path(path).split("public/")[1]
    @source.path= realPath
    @source.save
    flash[:notice]="la fuente fue exitosamente creada"
    redirect_to @source
    else
      not_type
    end
  end

  def destroy
    if session[:user_type]=="student"
    source = Source.find(params[:id])
    source.destroy

    if (source.destroyed?)
      flash[:notice]="Fuente exitosamente eliminada";
    else
      flash[:error]="No se pudo eliminar la fuente"
    end
    redirect_to "/sources"
    else
      not_type
    end
  end

  def not_type
    flash[:notice] = "You don't have the permissions required to do this action"
  end

end
