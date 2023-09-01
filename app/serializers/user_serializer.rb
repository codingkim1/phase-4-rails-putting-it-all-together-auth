class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :image_url, :bio
end
 

# user's ID, username, image URL, and bio