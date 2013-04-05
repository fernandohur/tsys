class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def create
    @meeting = Meeting.new

    @meeting.noteMeeting = params[:noteMeeting]
    @meeting.dateMeeting = params[:dateMeeting]
    @meeting.thesis_id = params[:thesis_id]

    uploaded_io = params[:dataFile]
    realPath = ""
    if uploaded_io != nil
    path = Rails.root.join('public', 'uploads', uploaded_io.original_filename);
    File.open(path, 'w:ASCII-8BIT') do |file|
      file.write(uploaded_io.read)

    end
    realPath = File.absolute_path(path).split("public/")[1]
    end

    @meeting.path= realPath
    @meeting.save
    flash[:notice]="The meeting has been successfully created"
    redirect_to @meeting
  end

  def destroy
    meeting = Meeting.find(params[:id])
    meeting.destroy

    if (meeting.destroyed?)
      flash[:notice]="The meeting has been deleted";
    else
      flash[:error]="The meeting couldn't be deleted"
    end
    redirect_to "/meetings"
  end

end
