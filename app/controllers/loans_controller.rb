class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show edit update destroy ]

  # GET /loans or /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1 or /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new
    @employers = Employer.all
    @students = Student.all
  end

  # GET /loans/1/edit
  def edit
    @loan = Loan.find(params[:id])
    @employers = Employer.all
    @students = Student.all

    @book = Book.all
  end

  def add_book
    @loan = Loan.find(params[:id])
    book = Book.find(params[:book_id])

    if @loan.books.include?(book)
      redirect_to @loan, notice: "Este livro já faz parte do Empréstimo."
    else
      @loan.books << book
      redirect_to @loan, notice: "Livro adicionado ao Empréstimo."
    end
  end

  def remove_book
    @loan = Loan.find(params[:id])
    @book = Book.find(params[:book_id])

    @loan.books.delete(@book)

    redirect_to @loan, notice: "Livro removido do Empréstimo."
  end

  # POST /loans or /loans.json
  def create
    @loan = Loan.new(loan_params)
    @employers = Employer.all
    @students = Student.all

    respond_to do |format|
      if @loan.save
        format.html { redirect_to loan_url(@loan), notice: "Empréstimo Criado com Sucesso!" }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1 or /loans/1.json
  def update
    @loan = Loan.find(params[:id])
    @employers = Employer.all
    @students = Student.all

    @book = Book.all

    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to loan_url(@loan), notice: "Loan was successfully updated." }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1 or /loans/1.json
  def destroy
    @loan.destroy

    respond_to do |format|
      format.html { redirect_to loans_url, notice: "Empréstimo Apagado com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loan_params
      params.require(:loan).permit(:employer_id, :student_id, :loan_date, :return, :forecasted_return,
                                   add_book_to_loans_attributes: [:book_id])
    end
end

# ,loan_books_attributes: [:book_id]
