class GithubController < ApplicationController
  def create
    code = params[:code]
    client_id = ENV['client_id']
    client_secrect = ENV['client_secrect']
  
    conn = Faraday.new(url: 'https://github.com', headers: {'Accept': 'application/json'})
  
    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secrect
    end
  
    data = JSON.parse(response.body, symbolize_names: true)
    access_token = data[:access_token]
  
    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {
          'Authorization': "token #{access_token}"
      }
    )
    response = conn.get('/user')
    
    data = JSON.parse(response.body, symbolize_names: true)


    user          = User.find_or_create_by(uid: data[:id])
    user.username = data[:login]
    user.name = data[:name]
    user.uid      = data[:id]
    user.token    = access_token
    user.save

    session[:user_id] = user.id

    redirect_to dashboard_path
  end
end