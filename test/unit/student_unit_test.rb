class StudentTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test 'auth student with correct credentials should return Professor' do
    Student.delete_all
    password = 'asd'
    username = 'dfgsdg'
    name = 'lkan5234'
    Student.new(:name=>name,:password=>password,:username=>username)


    student = Student.auth(username, password)

    assert student.name == name
    assert student.password == password
    assert student.username == username

  end

  test 'auth student with incorrect credentials returns null' do

    Student.delete_all
    password = 'asd'
    username = 'dfgsdg'
    name = 'lkan5234'
    Student.new(:nombre=>name,:password=>password<<'1',:username=>username)


    student = Student.auth(username, password)

    assert student==nil

  end

end