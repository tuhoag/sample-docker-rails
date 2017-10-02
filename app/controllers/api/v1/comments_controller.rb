class Api::V1::CommentsController < Api::V1::APIController
  def index
    comments = Article.find_by(id: params[:article_id]).comments

    render json: comments
  end
end

