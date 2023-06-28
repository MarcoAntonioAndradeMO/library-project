class AddThemeToBook < ApplicationRecord
  belongs_to :theme
  belongs_to :book

  # validates :book_id, uniqueness: {scope: :theme_id}
end
