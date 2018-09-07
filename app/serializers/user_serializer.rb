class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :publications
end
