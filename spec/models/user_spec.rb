require 'spec_helper'

describe User do
  before do
    @user = User.new(first_name: "Andy", last_name: "Principe", email: "andyprincipe@forte.com", password_digest: "123456", user_image_url: "http://images.huffingtonpost.com/2013-08-09-TheDogGunsMoney-TheDogJohnGunsMoney600.jpg")
  end

  it "should return the first_name of the user" do
    expect(@user.first_name).to eq("Andy")
  end

  it "should return the last_name of the user" do
    expect(@user.last_name).to eq("Principe")
  end

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:user_image_url) }  

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }

  it { should validate_uniqueness_of(:email) }
  
  it { should have_many(:scores) }

end