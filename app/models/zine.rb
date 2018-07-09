class Zine < ApplicationRecord

  has_one :publication, as: :publisher
  has_many :issues, dependent: :destroy

end
