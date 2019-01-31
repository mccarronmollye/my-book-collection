require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch("SESSION_SECRET")
  end

  get "/" do
    erb :home
  end


  def if_not_logged_in_redirect_to_home
    if !logged_in?
      redirect '/'
    end
    end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user #used in any method and controller
      User.find(session[:user_id])
    end

   end

end
