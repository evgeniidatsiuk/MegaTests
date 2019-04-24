require 'rails_helper'

RSpec.describe UserparamsController, type: :controller do

    let!(:user){ build(:user, email: "test@test.com")}

    login_user

    it "should have a current_user" do
        expect(subject.current_user).to_not eq(nil)
      end

      describe "GET #show" do
        it "has a 200 status code" do
          expect(response.status).to eq(200)
        end
        it "responds to html by default" do
          expect(response.content_type)=="text/html"
        end
      end

      describe 'POST #destroy' do
        it "should not delete unavailable userparam" do
          expect(:delete => "/userparams/38").not_to be_routable
        end
      end

      describe 'GET #new' do

        it "should find current_user and open form for create userparam" do
          get :new#, params: {id: subject.current_user.userparam.id}

          expect(subject.current_user.email).to eq("tester@test.com")
          expect(subject.current_user.email).to_not eq(user.email)
          expect(response).to have_http_status(200)
        end
      end

      describe 'GET #create' do

        it "should create userparam and redirect_to index page" do
          get :create, params: {userparam: {firstname: "Tester",lastname: "Tester",age: 1}}

          expect(subject.current_user.userparam.firstname).to eq("Tester")
          expect(subject.current_user.userparam.lastname).to eq("Tester")
          expect(subject.current_user.userparam.age).to eq(1)

        #  expect(subject.current_user.userparam.nickname).to_not eq(user.userparam.nickname)
          expect(response).to redirect_to root_path
        end
      end


      describe 'GET #edit' do
      it "should find current_user and open form for edit userparam" do
        get :edit,params: {id: subject.current_user.id}
        expect(subject.current_user.email).to eq("tester@test.com")
        expect(subject.current_user.email).to_not eq(user.email)
        expect(response).to have_http_status(200)
      end
    end

    describe 'PATCH #update' do
    	before do
        @userparam = create(:userparam, user_id: subject.current_user.id)
      end
      it "should update userparam and redirect to index page" do
        patch :update, params: { id: subject.current_user.id, userparam: {firstname: "Tester2",lastname: "Tester2",age: 1}}
        expect(subject.current_user.userparam.firstname).to eq("Tester2")
        expect(subject.current_user.userparam.lastname).to eq("Tester2")
        expect(subject.current_user.userparam.age).to eq(1)
        expect(response).to redirect_to root_path
      end
  end




end
