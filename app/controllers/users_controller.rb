#require "./app/models/users"

class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    @users = User.all
    erb :"/users/index"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/signup"
  end

  # POST: /users
  post "/users" do
    @user = User.create(params[:user])

    if @user.save
      redirect "/users/login"
    else
      redirect "/failure"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    if_not_logged_in_redirect_to_home
    @user = current_user
    erb :"/users/show"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    if_not_logged_in_redirect_to_home
    @user = User.find(params[:id]) #w/o this line of code it breaks!!!
    erb :"/users/edit"
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
  delete "/users/:id" do
    if_not_logged_in_redirect_to_home
    @user = User.find_by_id(params[:id])
    @user.delete
    redirect "/users/logout" #redirected to application's home page
  end

end
