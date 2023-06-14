class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    theme = Theme.find_by(theme: book_params[:theme])
    author = Author.find_by(signature: book_params[:author_signature])
    @book = Book.new(book_params)
    @book.theme_ids = theme.id
    @book.author_id = author.id


    respond_to do |format|
      if author and theme
        if @book.save
          AddAuthorToBook.new(author_id: author.id, book_id: @book.id)
          AddThemeToBook.new(theme_id: theme.id, book_id: @book.id)

          format.html { redirect_to book_url(@book), notice: "Livro criado com Suceso!" }
          format.json { render :show, status: :created, location: @book }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end

      else
        redirect_to new_book_path, alert: "Autor não encontrado."
      end

      # else
      #   redirect_to new_book_path, alert: "Tema não encontrado."
      # end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
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
    params.require(:book).permit(:book_name, :author_id, :year, :isbn, :quantity, :author_signature, :theme_id, :theme)
  end
  end

