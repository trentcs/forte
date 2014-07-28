require 'spec_helper'

describe UsersController do
  render_views
    it "should create a new user" do
      User.create(first_name: 'John', last_name: 'Smith', email: 'jsmitty@aol.com', password_digest: 'yoloyolo')
      expect(User.last.first_name).to eq('John')
    end

    it "should run the show action" do
      user = User.create(first_name: "hans", last_name: "solo", email: "han@solo.com", password_digest: "password")
      visit user_path(user)
      response.should render_template(:show)
      expect(response.status).to eq(200)
    end

    it "should edit a user" do
      user = User.create(first_name: "luke", last_name: "skywalker", email: "lskywalker@aol.com", password_digest: "password")
      user.update(first_name: "Luke")
      expect(user.first_name).to eq("Luke")
    end


end
