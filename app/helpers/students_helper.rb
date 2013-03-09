module StudentsHelper

  def render_student(student)
    render :partial => "student/student_partial" , :locals => {:student=>student}
  end

end
