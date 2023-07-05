class AddBorrowedToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :borrowed, :integer, default: 0
  end
end
