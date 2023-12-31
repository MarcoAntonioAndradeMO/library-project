class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all

    start_year = params.dig(:start_date, :year).to_i
    end_year = params.dig(:end_date, :year).to_i

    if start_year > 0 && end_year > 0
      @books = @books.where(year: start_year..end_year)
    end
    @top_books_loans = Book.all.sort_by { |book| book.loan_count }.reverse.take(5)
  end


  # GET /books/1 or /books/1.json
  def show
    themes_path
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    @themes = Theme.all
  end

  # POST /Add theme to Book
  def add_theme
    @book = Book.find(params[:id])
    theme = Theme.find(params[:theme_id])

    if @book.themes.include?(theme)
      redirect_to @book, notice: "Tema já associado ao livro."
    else
      @book.themes << theme
      redirect_to @book, notice: "Tema adicionado ao Livro com sucesso."
    end
  end

  def remove_theme
    @book = Book.find(params[:id])
    @theme = Theme.find(params[:theme_id])

    @book.themes.delete(@theme)

    redirect_to @book, notice: 'Tema Removido do Livro!'
  end

  def remove_author
    @book = Book.find(params[:id])
    @author = Author.find(params[:author_id])

    @book.authors.delete(@author)

    redirect_to @book, notice: 'Autor Removido do Livro!'
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Livro criado com Suceso!" }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    @book = Book.find(params[:id])
    @themes = Theme.all
    @author = Author.all

    if @book.update(book_params)
      redirect_to @book, notice: "Livro atualizado com sucesso!"
    else
      render :edit
      return
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Livro apagado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:book_name,
                                  :year, :isbn, :quantity, add_theme_to_books_attributes: [:theme_id],
                                 add_author_to_books_attributes: [:author_id] )
  end
  end

