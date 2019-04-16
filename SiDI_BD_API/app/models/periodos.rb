class Periodos < ApplicationRecord
  has_many :c_periodos
  has_many :c_campus
  belongs_to :sesiones
end
