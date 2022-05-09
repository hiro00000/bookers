class BooksController < ApplicationController

  def index
    @books = Book.all
    @book =Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = 'Book was successfully created.'
    else
      @books = Book.all
      render :index
    end  
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end
  
  def update
    @books = Book.find(params[:id])
    @books.save
    if  @books.update(book_params)
      redirect_to book_path(@books.id)
      flash[:success] = 'Book was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    list = Book.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト  
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
