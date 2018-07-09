class ArticlesController < ApplicationController

  def show
    set_article
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

end
