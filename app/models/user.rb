class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_secure_password
  has_many :authorships, dependent: :destroy
  has_many :articles, through: :authorships, dependent: :destroy
  has_many :publications, as: :publisher, dependent: :destroy
  has_many :zines, through: :publications, dependent: :destroy
  has_many :house_memberships, dependent: :destroy
  has_many :houses, through: :house_memberships, dependent: :destroy
end
