class Publication < ApplicationRecord
  scope :genres, -> (genre) { where("genres like ?", "#{genre}%") }
  scope :title, -> (title) { where("title like ?", "#{title}%") }
  scope :tags, -> (tags) { where("tags like ?", "#{tags}%") }

  has_many :likes
  has_many :users, through: :likes
end
