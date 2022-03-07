class User < ApplicationRecord
  has_many :inventories, foreign_key: 'users_id', dependent: :destroy
  has_many :recipes, foreign_key: 'users_id', dependent: :destroy
  has_many :foods, foreign_key: 'users_id', dependent: :destroy
end
