class StudentsController < ApplicationController

  def registerStudent
    @students=Student.all
  end

  def index
    render :registerStudent
  end

  def new
    @student=Student.new

  end

  def show
    render :registerStudent
  end

  def create
    name = params[:name]
    password = params[:password]
    thesis = 1
    username=params[:username]

    newStudent=Student.new(:name =>name, :password =>password, :thesis_id => thesis, :username => username)

    puts "------------------------------"

    respond_to do |format|
      if newStudent.save
        format.html { redirect_to(newStudent, :notice => "Student Registed") }
        format.json { render :show }
      else
        format.html { redirect_to(newStudent, :notice => "Student NOT Registed")  }
        format.json { render(:json => { :errors => newStudent.errors }, :status => :not_acceptable) }
      end


    end

  end


end
