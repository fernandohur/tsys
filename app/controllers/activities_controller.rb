class ActivitiesController < ApplicationController
  # GET /activities
  # GET /activities.json
  def index
    @able = session["user_type"].blank? ? false:true
    @activites
    if @able
      @student = Student.find(session[:user_id])
      @thesis = @student.thesis

      @activities = @thesis.activities

    end



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])
    @comments = @activity.comments
    @isStudent = session["user_type"] == "student"
    @isMe = @activity.thesis.student_id = session["user_id"]
    @studentName = Student.find(session["user_id"]).name

    if params[:commit] == "Actualizar"
      @activity.state=params["state"]
      @activity.save!
    elsif params[:commit]=="Agregar"
      @activity.comments.create(body: params["bodyA"].to_s)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

end
