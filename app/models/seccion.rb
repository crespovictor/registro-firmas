class Seccion < ApplicationRecord
	has_many :registros
	accepts_nested_attributes_for :registros
end
