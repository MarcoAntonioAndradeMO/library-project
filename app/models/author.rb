class Author < ApplicationRecord
  has_many :add_author_to_books
  has_many :books, through: :add_author_to_books

  attr_accessor :book

  def add_book(book)
    self.book = book
  end
end
