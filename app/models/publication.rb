class Publication < ApplicationRecord
  scope :genres, -> (genre) { where("genres like ?", "#{genre}%") }
  scope :title, -> (title) { where("title like ?", "#{title}%") }
  scope :tags, -> (tags) { where("tags like ?", "#{tags}%") }

  has_many :likes
  has_many :users, through: :likes

  include SimpleRecommender::Recommendable
  similar_by :users

  def self.get_default
    self.where(featured: true)
  end

  def self.search_tags_and_titles(search)
    self.where("lower(tags) like ?", "%#{search}%").or(self.where("lower(title) like ?", "%#{search}%")).order(:title)
  end

  def self.search_filter(filter)
    self.where("genres like ?", "%#{filter}%").order(:title)
  end

  def self.find_title(title)
    self.where("lower(title) = ?", "#{title}").first
  end

  def search_tags_and_titles(search)
    self.where("lower(tags) like ?", "%#{search}%").or(self.where("lower(title) like ?", "%#{search}%")).order(:title)
  end
  
end
