class BooksController < ApplicationController

  # GET: /books #DONE
  get "/books" do
    if_not_logged_in_redirect_to_home #1st grab a user, how can you grab all the books from user
    erb :"/books/index.html"
  end

  # GET: /books/new
  get "/books/new" do
    if_not_logged_in_redirect_to_home

    erb :"/books/new.html"
  end

  # POST: /books
  post "/books" do
    if_not_logged_in_redirect_to_home
    @book = Book.create(params)
    @book.update(user_id: current_user.id)
    redirect "/books"
  end

  # GET: /books/5
  get "/books/:id" do
    if_not_logged_in_redirect_to_home
    #binding.pry
    @book = Book.find(params[:id])
    erb :"/books/show.html"
  end

  # GET: /books/5/edit
  get "/books/:id/edit" do
    if_not_logged_in_redirect_to_home
    erb :"/books/edit.html"
  end

  # PATCH: /books/5
  patch "/books/:id" do
    if_not_logged_in_redirect_to_home
    redirect "/books/:id"
  end

  # DELETE: /books/5/delete
  delete "/books/:id/delete" do
    if_not_logged_in_redirect_to_home
    redirect "/books"
  end
end
