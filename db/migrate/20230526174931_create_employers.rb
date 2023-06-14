class CreateEmployers < ActiveRecord::Migration[7.0]
  def change
    create_table :employers do |t|
      t.string :proper_name
      t.string :function
      t.date :effectuation_date
      t.date :resignation_date
      t.string :loans

      t.timestamps
    end
  end
end
