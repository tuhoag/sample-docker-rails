class CommentsController < ApplicationController
  
  def index
    @comments = Article.find_by(id: params[:article_id]).comments
    
  end
end
