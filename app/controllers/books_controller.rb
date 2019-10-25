class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def new
  	  @book = Book.new
  end

  def create
  	  @book = Book.new(book_params)
      @user = current_user
      @book.user_id = current_user.id
  	  if @book.save
         flash[:notice] = "Book was successfully created."
         redirect_to book_path(@book.id)
      else
         @books = Book.all
         flash[:notice] = "Error"
         redirect_to user_path(@user)
      end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
         flash[:notice] = "You have updated book successfully."
         redirect_to book_path(@book.id)
      else
         flash[:notice] = "Error"
         redirect_to edit_book_path(@book.id)
      end
  end

  def destroy
  	  @book = Book.find(params[:id])
  	  @book.destroy
      redirect_to books_path
  end

  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
end
