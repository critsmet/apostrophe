class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :description, :image_url, :publications
end
