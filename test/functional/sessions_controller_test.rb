require 'test_helper'

class SourcesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do

    @user = Student.new(:name=>'name',:password=>'pass',:username=>'username')
    @user.save

    @prof = Professor.new(:nombre=>name,:password=>password,:username=>username)
    @prof.save

  end

  test 'test login for Student with existing credentials should set session' do

    post :login , {:format=>:html, :username=>@user.username, :password=>@user.password}
    assert session[:user_type] == :student
    assert session[:username] == @user.username


  end

  test 'test login for Prof with existing credentials should set session' do

    post :login , {:format=>:html, :username=>@prof.username, :password=>@prof.password}
    assert session[:user_type] == :professor
    assert session[:username] == @prof.username

  end

  test 'test login for Student with non existing credentials should not set session' do

    post :login , {:format=>:html, :username=>@user.username, :password=>'@user.password'}
    assert session[:user_type] == nil
    assert session[:username] == nil

  end

end
