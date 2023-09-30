class HomeController < ApplicationController
  def index
    @client_id = ENV['client_id']
    @google_client_id = ENV['google_client_id']
  end
end