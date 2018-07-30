class Zine < ApplicationRecord
  validates_presence_of :name
  belongs_to :publication, dependent: :destroy
  has_many :issues, dependent: :destroy
  accepts_nested_attributes_for :publication

  def publisher
    self.publication.publisher
  end

  def publisher_name
    self.publication.publisher.name
  end

  def valid_attribute?(name)
    self.valid?
    self.errors[name].blank?
  end

end
