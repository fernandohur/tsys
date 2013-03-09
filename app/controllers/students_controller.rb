class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student=Student.new
  end

  def show
    @student=Student.find( params[:id])
  end

  def create

    @student = Student.new

    @student.name = params[:student_name]
    @student.password = params[:password]
    @student.thesis_id = 1
    @student.username = params[:username]
    @student.save
    flash[:notice]="Student Registed"
    puts "----------------"
    puts @student.name
    redirect_to @student
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
