class UsersController < ApplicationController
  require 'net/http'
  require 'uri'

  def new
    return unless current_user

    redirect_to after_login_path
  end

  def create
    id_token = params[:idToken]
    name = params[:name]
    channel_id = ENV.fetch('CHANNEL_ID', nil)
    res = Net::HTTP.post_form(URI.parse('https://api.line.me/oauth2/v2.1/verify'),
                              { 'id_token' => id_token, 'client_id' => channel_id })
    line_user_id = JSON.parse(res.body)['sub']
    @user = User.find_or_create_by(line_user_id:) do |user|
      user.name = name
    end
    session[:user_id] = @user.id
    render json: @user
  end
end
