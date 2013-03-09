module StudentsHelper

  def render_student(student)
    render :partial => "students/student_partial" , :locals => {:student=>student}
  end

end
