class DashboardController < ApplicationController
  def index
    @top_students = Student.all.sort_by { |student| student.loan_count }.reverse.take(5)
    @top_books = Book.all.sort_by {|book|book.loan_count}.reverse.take(5)
  end


end
