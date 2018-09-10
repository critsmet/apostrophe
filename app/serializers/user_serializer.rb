class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :description, :email, :website_url, :image_url, :publications
end
