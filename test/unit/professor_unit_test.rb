class ProfessorTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test " auth professor with correct credentials should return Professor" do
    Professor.delete_all
    password = 'asd'
    username = 'dfgsdg'
    name = 'lkan5234'
    Professor.new(:nombre=>name,:password=>password,:username=>username)


    professor = Professor.auth(username, password)

    assert professor.name == name
    assert professor.password == password
    assert professor.username == username

  end

  test 'auth professor with incorrect credentials returns null' do

    Professor.delete_all
    password = 'asd'
    username = 'dfgsdg'
    name = 'lkan5234'
    Professor.new(:nombre=>name,:password=>password<<'1',:username=>username)


    professor = Professor.auth(username, password)

    assert professor==nil

  end

  test ' testing get_students ' do
    Professor.delete_all
    Student.delete_all
    Thesis.delete_all

    p = Professor.new(:nombre=>'name',:password=>'password',:username=>'username')
    p.save!

    s1 = Student.new(:name=>'name',:password=>'password',:username=>'username')
    s1.save!

    t1 = Thesis.new(:name=>'mondaquera',:student_id=>s.id)
    t1.save!

    s2 = Student.new(:name=>'name',:password=>'password',:username=>'username')
    s2.save!

    t2 = Thesis.new(:name=>'mondaquera',:student_id=>s.id)
    t2.save!

    students = p.get_students
    assert students.size==2

  end



end