class AddBookToLoan < ApplicationRecord
  belongs_to :book
  belongs_to :loan
end
