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
    @book = Book.find(params[:id]) #w/o this line of code it breaks!!!
    erb :"/books/edit.html"
  end

  # PATCH: /books/5
  patch "/books/:id" do
    if_not_logged_in_redirect_to_home
    @book = Book.find(params[:id])
    @book.title = params[:title]
    @book.author = params[:author]
    @book.genre = params[:genre]
    @book.status = params[:status]
    @book.save
    redirect to "/books/#{@book.id}"
  end

  # DELETE: /books/5
  delete "/books/:id" do
    if_not_logged_in_redirect_to_home
    @book = Book.find_by_id(params[:id])
    @book.delete
    redirect to "/books"
  end
end
