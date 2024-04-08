class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @article.comments.create(comment_params)

    redirect_to article_patch(@article)
  end

  private

  def comment_params
    params.require(:comments).permit(:author, :body)
  end
end
