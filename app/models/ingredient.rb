class Ingredient < ApplicationRecord
  # has_and_belongs_to_many :recipes
  has_many :preparations, dependent: :destroy
  has_many :recipes, through: :preparations
end
