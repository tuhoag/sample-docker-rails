class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :comments_count

  belongs_to :user, key: :author, serializer: AuthorSerializer

  def body
  	object.body.truncate(50)	
  end

  def comments_count
  	object.comments.count	
  end
end
