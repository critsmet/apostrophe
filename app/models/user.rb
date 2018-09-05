class User < ApplicationRecord
  has_many :likes
  has_many :publications, through: :likes
end
