class AddLoanCountToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :loan_count, :integer, default: 0
  end
end
