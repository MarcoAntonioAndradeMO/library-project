class Student < ApplicationRecord
  validates :cpf, uniqueness: true
  validates :registration, uniqueness: true

  has_many :loans

end
