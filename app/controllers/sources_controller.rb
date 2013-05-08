class SourcesController < ApplicationController

  def index
    sort_by = params[:sortby]
    order = params[:order]
    filter = params[:filter]

    if session[:user_type] == "student"
      puts Student.find(session[:user_id]).thesis_id
    end
    #Searchs only the sources of the student

    if sort_by
      @sources = (Source.where("thesis_id LIKE " +(Student.find_by_username(session[:login]).thesis_id).to_s)).order(sort_by << " " << order)
    elsif filter
      @sources = Source.where("category LIKE '%#{filter}%' AND thesis_id LIKE " +(Student.find_by_username(session[:login]).thesis_id).to_s)
    else
      @sources = Source.where("thesis_id LIKE " +(Student.find_by_username(session[:login]).thesis_id).to_s)
    end
  end

  def show
    @source = Source.find(params[:id])
  end

  def new
    if is_student
      @source = Source.new
    else
      not_type
    end
  end


  def create
    if is_student
      @student = Student.find(session[:user_id])
      @source = Source.new

      @source.descripccion = params[:descripccion]
      @source.name = params[:name]
      @source.thesis_id = @student.thesis_id
      @source.category = params[:category]

      uploaded_io = params[:dataFile]

      path = Rails.root.join('public', 'uploads', uploaded_io.original_filename);
      File.open(path, 'w:ASCII-8BIT') do |file|
        file.write(uploaded_io.read)

      end
      realPath = File.absolute_path(path).split("public/")[1]
      @source.path= realPath

      if @source.save
        flash[:notice]="la fuente fue exitosamente creada"
        redirect_to @source
      else
        render :action => 'new'
      end
    else
      not_type
    end
  end

  def destroy
    if is_student
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
    redirect_to '/sources'
  end

end
