class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :inventories, foreign_key: 'users_id', dependent: :destroy
  has_many :recipes, foreign_key: 'users_id', dependent: :destroy
  has_many :foods, foreign_key: 'users_id', dependent: :destroy
end
