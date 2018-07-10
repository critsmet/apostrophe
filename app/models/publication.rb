class Publication < ApplicationRecord
  belongs_to :publisher, polymorphic: true
  has_one :zine, dependent: :destroy
end
