class Book < ApplicationRecord
  # validates :isbn, uniqueness: true

  has_many :add_author_to_books
  has_many :authors, through: :add_author_to_books, dependent: :destroy

  has_many :add_theme_to_books
  has_many :themes, through: :add_theme_to_books

  has_many :add_book_to_loans
  has_many :loans, through: :add_book_to_loans

  accepts_nested_attributes_for :add_author_to_books
  attr_accessor :author_signature

  accepts_nested_attributes_for :add_theme_to_books
  attr_accessor :theme

  def add_author(author)
    author.book = self
  end

  def add_theme(theme)
    theme.book = self
  end

end
