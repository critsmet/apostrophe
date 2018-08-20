class PublicationSerializer < ActiveModel::Serializer
  attributes :id, :title, :tagline, :url, :cover_image_url, :description, :email, :team, :genres, :tags, :apostrophe_publisher_id
end
