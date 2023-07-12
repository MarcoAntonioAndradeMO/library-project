class DashboardController < ApplicationController
  def index
    @top_students = Student.all.sort_by { |student| student.loan_count }.reverse.take(5)
  end


end
