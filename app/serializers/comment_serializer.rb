class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id

  
  attribute :author

  def author
  	AuthorSerializer.new(object.user, { root: false })
  end
end
