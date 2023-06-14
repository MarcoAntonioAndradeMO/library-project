class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :proper_name
      t.string :signature


      t.timestamps
    end
  end
end
