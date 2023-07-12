class AddLoanCountToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :loan_count, :integer, default: 0
  end
end
