class Article < ApplicationRecord
  belongs_to :issue
  has_many :authorships, dependent: :destroy
  has_many :users, through: :authorships
end
