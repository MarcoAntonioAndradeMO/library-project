class AddThemeToBook < ApplicationRecord
  belongs_to :theme
  belongs_to :book
end
