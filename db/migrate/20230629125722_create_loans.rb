class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.references :book, null: false, foreign_key: true
      t.references :employer, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.date :loan_date
      t.date :return
      t.date :forecasted_return

      t.timestamps
    end
  end
end
