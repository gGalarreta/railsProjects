class Alumnos < ApplicationRecord
  validates :matricula, presence: true
  self.primary_keys = :apellido_paterno, :matricula, :apellido_materno
end
