class MeetingNotesController < ApplicationController
  def new

  end

  def index
    meeting = Meeting.find(params[:meeting_id])
    @meeting_notes = meeting.meeting_notes
    @meeting_note = MeetingNote.new
  end

  def destroy
    meeting_note_id = params[:id]
    meeting_note = MeetingNote.find(meeting_note_id)
    s = meeting_note.meeting
    meeting_note.delete
    flash[:notice]="note destroyed";
    redirect_to meeting_meeting_notes_path(s)
  end

  def create
    meeting_note = MeetingNote.new()
    meeting_note.noteText= params[:noteText]
    meeting_note.meeting_id= params[:meeting_id]
    uploaded_io = params[:dataFile]
    realPath = ""
    if uploaded_io != nil
      path = Rails.root.join('public', 'uploads', uploaded_io.original_filename);
      File.open(path, 'w:ASCII-8BIT') do |file|
        file.write(uploaded_io.read)

      end
      realPath = File.absolute_path(path).split("public/")[1]
    end

    meeting_note.path= realPath

    meeting_note.save
    flash[:notice]="Note added"

    redirect_to meeting_meeting_notes_path(meeting_note.meeting)
  end
end
