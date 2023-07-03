class CreateAddBookToLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :add_book_to_loans do |t|
      t.references :book, null: false, foreign_key: true
      t.references :loan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
