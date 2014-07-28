require 'spec_helper'

describe WelcomeController do
  render_views
  it 'loads the index page' do 
    visit root_path
    response.should render_template(:index)
    expect(response.status).to eq(200)
  end 


end
