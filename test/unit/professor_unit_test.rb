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

end