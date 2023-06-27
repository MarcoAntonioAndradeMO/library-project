class Student < ApplicationRecord
  validates :cpf, uniqueness: true
  validates :registration, uniqueness: true
end
