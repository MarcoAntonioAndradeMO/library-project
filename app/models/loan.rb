class Loan < ApplicationRecord

  has_many :add_book_to_loans
  has_many :books, through: :add_book_to_loans

  belongs_to :employer
  belongs_to :student

  attr_accessor :book

  def add_book(book)
    self.book = book
  end

end
