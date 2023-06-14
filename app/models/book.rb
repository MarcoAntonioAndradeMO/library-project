class Book < ApplicationRecord
  has_many :add_author_to_books
  has_many :authors, through: :add_author_to_books

  has_many :add_theme_to_books
  has_many :themes, through: :add_theme_to_books

  attr_accessor :author_signature

  attr_accessor :theme

  def add_author(author)
    author.book = self
  end

  def add_theme(theme)
    theme.book = self
  end

end
