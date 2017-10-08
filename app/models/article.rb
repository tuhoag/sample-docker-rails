class Article < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true

  belongs_to :user
  has_many :comments

  after_save :clear_cache

  def self.fetch_all
  	articles_json = $redis.get('articles')

  	if articles_json.nil?
  		articles = Article.all
  		articles_json = articles.to_json
  		$redis.set('articles', articles_json)
  		$redis.expire('articles', 10.seconds.to_i)
  	end

  	JSON.load articles_json
  end

  protected
  def clear_cache
  	$redis.del('articles')
  end
end
