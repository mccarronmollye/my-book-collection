#require "./app/models/users"

class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    @users = User.all
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/signup.html"
  end

  # POST: /users
  post "/users" do
    @user = User.create(params[:user])

    if @user.save
      redirect "/login"
    else
      redirect "/failure"
    end
  end

  #failure redirect
  get "/failure" do
    erb :"/users/failure.html"
  end

  #GET: /users/login
  get "/users/login" do
    erb :"/users/login.html"
  end

  #POST: /login
  post "/login" do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      #erb :"/users/account.html"#
      redirect "/account"
    else
      redirect "/failure"
    end
  end

  get "/account" do
    erb :"/users/account.html"
  end

  #GET: /users/logout
  get "/users/logout" do
    session.clear
    redirect "/"
  end

  # GET: /users/5
  get "/users/:id" do
    if_not_logged_in_redirect_to_home
    @user = current_user
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    if_not_logged_in_redirect_to_home
    @user = User.find(params[:id]) #w/o this line of code it breaks!!!
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
      if_not_logged_in_redirect_to_home
      @user = User.find(params[:id])
      @user.name = params[:name]
      @user.email = params[:email]
      @user.save
      redirect to "/users/#{@user.id}"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    if_not_logged_in_redirect_to_home
    redirect "/users"
  end


  #GET: successful login!
  #get "/account" do
  #  binding.pry
  #  @user = User.find(session[:user_id])
  #  erb :"/users/account.html"
  #end


end
