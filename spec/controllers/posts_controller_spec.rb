require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user){ build(:user, email: "test@test.com")}

  login_user

  it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end


          describe 'GET #new' do

            it "should find current_user and open form for create post" do
              get :new#, params: {id: subject.current_user.userparam.id}

              expect(subject.current_user.email).to eq("tester@test.com")
              expect(subject.current_user.email).to_not eq(user.email)
              expect(response).to have_http_status(200)
            end
          end
          #describe 'GET #create' do

          #  it "should create post and redirect_to index page" do
          #    get :create, params: {post: {title: "Tester",body: "Tester"}}
#
#              expect(subject.current_user.post.title).to eq("Tester")
#              expect(subject.current_user.post.body).to eq("Tester")


            #  expect(subject.current_user.userparam.nickname).to_not eq(user.userparam.nickname)
#              expect(response).to redirect_to root_path
#            end
#          end

describe 'GET #edit' do
it "should find current_user and open form for edit userparam" do
  get :edit,params: {post: subject.post.id}
  expect(subject.post.title).to eq("tester@test.com")
  expect(subject.post.body).to_not eq(user.email)
  expect(response).to have_http_status(200)
end
end
          describe "GET #show" do
            it "has a 200 status code" do
              expect(response.status).to eq(200)
            end
            it "responds to html by default" do
              expect(response.content_type)=="text/html"
            end
          end
end
