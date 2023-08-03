# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipe, foreign_key: :user_id, dependent: :destroy
  has_many :food, foreign_key: :user_id, dependent: :destroy
  validates :name, presence: true

  def admin?
    role == 'admin'
  end
end
