require 'spec_helper'
require 'spec_models'

RSpec.describe :main do
  it 'shows home page' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include 'Welcome to Search App'
  end

  it 'shows search form for Users' do
    get '/users'
    expect(last_response).to be_ok
    expect(last_response.body).to include('<h1>Users</h1>')
      .and include('<th>Id</th>')
      .and include('<th>Status</th>')
      .and include('<th>Title</th>')
      .and include('<th>Flag</th>')
  end

  it 'shows warning for Organizations' do
    get '/organizations'
    expect(last_response).to be_ok
    expect(last_response.body).to include('<h1>Organizations</h1>')
      .and include('No schema detected for Organization')
  end

  it 'loads a page for Tickets' do
    get '/tickets'
    expect(last_response).to be_ok
    expect(last_response.body).to include('<h1>Tickets</h1>')
  end
end
