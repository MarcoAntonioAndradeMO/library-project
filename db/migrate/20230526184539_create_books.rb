class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :book_name
      t.date :year
      t.string :isbn
      t.integer :quantity

      t.timestamps
    end
  end
end
