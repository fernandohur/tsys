class MeetingTasksController < ApplicationController

  def new

  end

  def index
    meeting = Meeting.find(params[:meeting_id])
    @meeting_tasks = meeting.meeting_tasks
    @meeting_task = MeetingTask.new
  end

  def destroy
    meeting_task_id = params[:id]
    meeting_task = MeetingTask.find(meeting_task_id)
    s = meeting_task.meeting
    meeting_task.delete
    flash[:notice]="task destroyed";
    redirect_to meeting_meeting_tasks_path(s)
  end

  def create
    meeting_task = MeetingTask.new(params[:meeting_task])
    meeting_task.meeting_id= params[:meeting_id]
    meeting_task.save
    flash[:notice]="task added"

    redirect_to meeting_meeting_tasks_path(meeting_task.meeting)
  end
end
