class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student=Student.new
  end

  def show
    @student=Student.find( params[:id])
    @thesis = @student.thesis;
  end

  def create

    @search = Student.find_by_username(params[:username])




      @student = Student.new
      @student.name = params[:student_name]
      @student.password = params[:password]
      @student.thesis_id = 1
      @student.username = params[:username]
      response=@student.save


   if response==true
     flash[:notice]="Student Registed"
     redirect_to @student
   else
     flash[:notice]="Student NOT Registed"
     redirect_to "/students"
   end





  end

  def destroy
    student = Student.find(params[:id])
    student.destroy

    if (student.destroyed?)
      flash[:notice]="Estudiante exitosamente eliminado";
    else
      flash[:error]="No se pudo eliminar el estudiante"
    end
    redirect_to "/students"
  end

  def edit

  end

end
