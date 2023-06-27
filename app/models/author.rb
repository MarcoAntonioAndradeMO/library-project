class Author < ApplicationRecord
  validates :proper_name, uniqueness: true
  validates :signature, uniqueness: true

  has_many :add_author_to_books
  has_many :books, through: :add_author_to_books,dependent: :destroy

  attr_accessor :book

  def add_book(book)
    self.book = book
  end
end
