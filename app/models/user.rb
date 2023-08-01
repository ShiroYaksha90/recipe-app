class User < ApplicationRecord
    has_many :recipe
    has_many :food
    validates :name, presence: true
end