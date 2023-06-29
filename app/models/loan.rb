class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :employer
  belongs_to :student
end
