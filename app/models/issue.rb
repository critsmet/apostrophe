class Issue < ApplicationRecord
  belongs_to :zine
  has_many :articles, dependent: :destroy
end
