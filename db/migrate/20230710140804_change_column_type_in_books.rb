class ChangeColumnTypeInBooks < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :year, :integer
  end
end
''