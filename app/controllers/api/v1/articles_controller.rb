class Api::V1::ArticlesController < Api::V1::APIController
  def index
    articles = Article.fetch_all

    render json: articles
  end

  def show
  	article = Article.find_by(id: params[:id])

  	render json: article, serializer: ArticleDetailSerializer
  end
end

