class User < ApplicationRecord
 #   devise :database_authenticatable, :registerable, :omniauthable, omniauth_providers: %i[google_oauth2]
  
    def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first
  
      # Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(
             email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user
    end
  end