class ArticleDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :body

  has_many :comments

  belongs_to :user, key: :author, serializer: AuthorSerializer
end
