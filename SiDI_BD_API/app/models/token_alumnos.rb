class TokenAlumnos < ApplicationRecord
  validates :token, presence: true
end