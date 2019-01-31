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
      erb :"/users/account.html"#
      #redirect "/account"
    else
      redirect "/failure"
    end
  end

  #GET: /users/logout
  get "/users/logout" do
    session.clear
    redirect "/"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end


  #GET: successful login!
  #get "/account" do
  #  binding.pry
  #  @user = User.find(session[:user_id])
  #  erb :"/users/account.html"
  #end


end
