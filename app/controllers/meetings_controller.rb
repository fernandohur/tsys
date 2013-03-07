class MeetingsController < ApplicationController



  def show
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /theses/new
  # GET /theses/new.json
  def new
    @meeting = Meeting.new(params[:@meeting])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeting }
    end
  end

  def create
    @meeting = Meeting.new(params[:meeting])
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Thesis was successfully created.' }
        format.json { render json: @meeting, status: :created, location: @meeting}
      else
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end
end
