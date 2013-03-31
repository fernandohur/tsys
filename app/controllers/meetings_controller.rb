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
    flash[:notice]="la cita fue exitosamente creada"
    redirect_to @meeting
  end

  def destroy
    meeting = Meeting.find(params[:id])
    meeting.destroy

    if (meeting.destroyed?)
      flash[:notice]="Cita exitosamente eliminada";
    else
      flash[:error]="No se pudo eliminar la cita"
    end
    redirect_to "/meetings"
  end

end
