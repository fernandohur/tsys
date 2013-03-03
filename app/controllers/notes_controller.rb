class NotesController < ApplicationController
  def new

  end

  def index
    source = Source.find(params[:source_id])
    @notes = source.notes
    @note = Note.new
  end

  def destroy
    note_id = params[:id]
    note = Note.find(note_id)
    s = note.source
    note.delete
    flash[:notice]="note destroyed";
    redirect_to source_notes_path(s)
  end

  def create
    note = Note.new(params[:note])
    note.source_id= params[:source_id]
    note.save
    flash[:notice]="Note added"

    redirect_to source_notes_path(note.source)
  end
end
