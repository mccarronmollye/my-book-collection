class BooksController < ApplicationController

  # GET: /books
  get "/books" do
    if_not_logged_in_redirect_to_home
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
    redirect "/books"
  end

  # GET: /books/5
  get "/books/:id" do
    if_not_logged_in_redirect_to_home
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
