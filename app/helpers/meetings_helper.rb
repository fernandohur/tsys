module MeetingsHelper

  def render_meeting(meeting)
    render :partial => "meetings/meeting_partial" , :locals => {:meeting=>meeting}
  end

end
