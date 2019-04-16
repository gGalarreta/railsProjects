class Sesiones < ApplicationRecord
  has_many :periodos
  has_many :c_campus
end
