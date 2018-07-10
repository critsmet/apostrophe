class ArticlesController < ApplicationController

  def show
    set_article
    set_zine
    set_issue
  end

  def new
    set_zine
    set_issue
    @article = Article.new
  end

  def create
    set_zine
    set_issue
    set_user
    @article = Article.new(article_params[:article])
    @article.issue_id = (article_params[:issue_id])
    @authorship = @article.authorships.new(user_id: @user.id)
    save_article_and_authorship
  end


  private

  def article_params
    params.permit({:article => [:body, :title]}, :issue_id)
  end

  def save_article_and_authorship
    if @article.valid? && @authorship.valid?
      @article.save
      @authorship.save
      redirect_to zine_issue_article_path(@zine.id, @issue.id, @article.id)
    else
      render :new
    end
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_issue
    @issue = Issue.find(params[:issue_id])
  end

  def set_zine
    @zine = Zine.find(params[:zine_id])
  end



end
