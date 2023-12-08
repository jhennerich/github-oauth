class SessionsController < ApplicationController
    def omniauth
        binding.pry
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
            session[:user_id] = user.id
            redirect_to dashboard_path
        else
            redirect_to '/login'
        end
    end
end