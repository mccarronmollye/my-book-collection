class BooksController < ApplicationController


  get "/books" do
    if_not_logged_in_redirect_to_home #1st grab a user, how can you grab all the books from user
    @books = current_user.books
    erb :"/books/index"
  end


  get "/books/new" do
    if_not_logged_in_redirect_to_home

    erb :"/books/new"
  end


  post "/books" do
    if_not_logged_in_redirect_to_home
    @book = Book.create(params)
    @book.update(user_id: current_user.id)
    redirect "/books"
  end


  get "/books/:id" do
    if_not_logged_in_redirect_to_home
    #binding.pry
    @book = Book.find(params[:id])
    if @book.user == current_user
      erb :"/books/show"
    else
      redirect to "/books"
    end
  end
  # GET /books/5/edit Ensure that users can edit and delete only their own resources - not resources created by other users.
  get "/books/:id/edit" do #route url, route variable, part of dynamic route
    if_not_logged_in_redirect_to_home

    @book = Book.find(params[:id]) #w/o this line of code it breaks!!!
    if @book.user == current_user
      erb :"/books/edit"
    else
      redirect to "/books"
    end
  end


  patch "/books/:id" do #can only do if books belong to user
    if_not_logged_in_redirect_to_home
    @book = Book.find(params[:id])

    if @book.user == current_user
      @book.title = params[:title]
      @book.author = params[:author]
      @book.genre = params[:genre]
      @book.status = params[:status]
      @book.save
      redirect to "/books/#{@book.id}"
    else
      redirect to "/books"
    end
  end


  delete "/books/:id" do #can only do if books belong to user
    if_not_logged_in_redirect_to_home
    @book = Book.find_by_id(params[:id])

    if @book.user == current_user
      @book.delete
      redirect to "/books"
    else
      redirect to "/books"
    end
   end
  end
