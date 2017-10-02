class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :author

  def author
  	AuthorSerializer.new(object.user)
  end
end
