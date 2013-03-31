class MeetingTasksController < ApplicationController

  def new
    @meeting_task = MeetingTask.new
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

  def edit
       @meeting = Meeting.find(params[:meeting_id])
       @meeting_task = @meeting.meeting_tasks.find(params[:id])

  end

  def update
    puts "--------------------------------------------"
    puts params
    meeting_task = MeetingTask.find(params[:id])
    meeting_task.task = params[:task]
    meeting_task.expireDate = params[:expireDate]
    if(params[:done] == nil)
      params[:done] = false
    end
    meeting_task.done = params[:done]
    meeting_task.meeting_id = params[:meeting_id]
    meeting_task.save
    flash[:notice]="task modified"

    redirect_to meeting_meeting_tasks_path(meeting_task.meeting)

  end
end
