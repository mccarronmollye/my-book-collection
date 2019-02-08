class SessionsController < ApplicationController


  get "/login" do
    if logged_in?
      redirect "/account" #redirects to home page if user is already logged in.
    else
      erb :"/sessions/login"
    end
  end


  post "/sessions/login" do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])#authenticates user based of user submitted.
      session[:user_id] = user.id
      #erb :"/users/account.html"#
      redirect "/account"
    else
      redirect "/failure"
    end
  end

  #failure redirect
  get "/failure" do
    erb :"/sessions/failure"
  end

  get "/account" do
    erb :"/sessions/account"
  end

  #GET: /users/logout
  get "/logout" do
    session.clear
    redirect "/"
  end


end
