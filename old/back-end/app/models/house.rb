class House < ApplicationRecord
  has_many :publications, as: :publisher, dependent: :destroy
  has_many :zines, through: :publications, dependent: :destroy
  has_many :house_memberships, dependent: :destroy
  has_many :users, through: :house_memberships

end
