class Food < ApplicationRecord
    validates :name, :measurement_unit, :price, :quantity, presence: true
end