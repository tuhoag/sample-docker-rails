class ArticleDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :body

  belongs_to :user, key: :author, serializer: AuthorSerializer
  has_many :comments
end
