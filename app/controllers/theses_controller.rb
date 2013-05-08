class ThesesController < ApplicationController


  def home

  end

  # GET /theses
  # GET /theses.json
  def index

    if session["user_type"]=="professor"
      @theses = Thesis.all
      @professor = Professor.find(session["user_id"])
    elsif session["user_type"]=="student"
           @student = Student.find(session["user_id"])
           @thesis = @student.thesis
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @theses }
    end
  end

  # GET /theses/1
  # GET /theses/1.json
  def show
    @thesis = Thesis.find(params[:id])
    @activities = @thesis.activities.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thesis }
    end
  end

  # GET /theses/new
  # GET /theses/new.json
  def new
    @thesis = Thesis.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thesis }
    end
  end

  # GET /theses/1/edit
  def edit
    @thesis = Thesis.find(params[:id])
  end

  # POST /theses
  # POST /theses.json
  def create

    @thesis = Thesis.new(params[:thesis])

    respond_to do |format|
      if @thesis.save
        @thesis.activities.create(name: "Initial bibliographic review", desc: "Description of this activity", state: "To Do")

        @thesis.activities.create(name: "Problem descripction",desc: "Description of this activity", state: "To Do")

        @thesis.activities.create(name: "Thesis objectives",desc: "Description of this activity", state: "To Do")

        @thesis.activities.create(name: "Solution strategy",desc: "Description of this activity", state: "To Do")

        @thesis.activities.create(name: "Implementation",desc: "Description of this activity", state: "To Do")

        @thesis.activities.create(name: "Validation",desc: "Description of this activity", state: "To Do")

        @thesis.activities.create(name: "Final thesis documentation and reports",desc: "Description of this activity", state: "To Do")


        format.html { redirect_to @thesis, notice: 'Thesis was successfully created.' }
        format.json { render json: @thesis, status: :created, location: @thesis }
      else
        format.html { render action: "new" }
        format.json { render json: @thesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /theses/1
  # PUT /theses/1.json
  def update
    @thesis = Thesis.find(params[:id])

    respond_to do |format|
      if @thesis.update_attributes(params[:thesis])
        format.html { redirect_to @thesis, notice: 'Thesis was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @thesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theses/1
  # DELETE /theses/1.json
  def destroy
    @thesis = Thesis.find(params[:id])
    @thesis.destroy

    respond_to do |format|
      format.html { redirect_to theses_url }
      format.json { head :no_content }
    end
  end

  # @return [Object]
  def authenticate
    password = params[:password]
    username = params[:username]

    #Using LDAP
    require 'rubygems'
    require 'net/ldap'

    ldap = Net::LDAP.new
    ldap.host = "localhost"
    ldap.port = 10389
    userText=   "uid=" +username+",ou=users,ou=system"

    ldap.auth userText, password
    result=ldap.bind

    if result==true
      @accessed=Student.find_by_username(username)
      redirect_to @accessed
    else
      flash[:notice]="Wrong username/password"
      redirect_to "/login"
    end



  end

end
