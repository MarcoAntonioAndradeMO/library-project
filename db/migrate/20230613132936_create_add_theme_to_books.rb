class CreateAddThemeToBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :add_theme_to_books do |t|
      t.references :theme, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
