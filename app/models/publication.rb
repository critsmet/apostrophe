class Publication < ApplicationRecord
  belongs_to :publisher, polymorphic: true
  belongs_to :zine, dependent: :destroy
end
