class Recipe < ApplicationRecord
  has_and_belongs_to_many :courses, dependent: :destroy
  # has_and_belongs_to_many :ingredients
  belongs_to :cuisine
  has_many :preparations, dependent: :destroy
  has_many :ingredients, through: :preparations
  belongs_to :user
end
