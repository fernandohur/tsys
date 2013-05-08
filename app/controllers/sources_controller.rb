class SourcesController < ApplicationController

  def index
    sort_by = params[:sortby]
    order = params[:order]
    filter = params[:filter]

    if session[:user_type] == :student

      puts "-------------------------------"
      puts Student.find(session[:user_id]).id
      puts Thesis.find_by_student_id(Student.find(session[:user_id]).id).id
      puts Source.find_all_by_thesis_id(Thesis.find_by_student_id(Student.find(session[:user_id]).id).id)
      puts "-------------------------------"
      @sources=Source.find_all_by_thesis_id(Thesis.find_by_student_id(Student.find(session[:user_id]).id).id)
    end
    #Searchs only the sources of the student

    if sort_by
      @sources = @sources.order(sort_by << " " << order)
    elsif filter
      @sources = @sources.where("category LIKE '%#{filter}%'")
    else
      @sources = @sources
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
      @source = Source.new(params[:source])
      @student = Student.find(session[:user_id])

      thesis = @student.thesis_id
      if thesis
        @source.thesis_id = @student.thesis_id
      end
      @source.category = params[:category]

      uploaded_io = params[:dataFile]
      realPath = ""
      if uploaded_io != nil
        path = Rails.root.join('public', 'uploads', uploaded_io.original_filename);
        File.open(path, 'w:ASCII-8BIT') do |file|
          file.write(uploaded_io.read)

        end
        realPath = File.absolute_path(path).split("public/")[1]
      end

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
