class IssuesController < ApplicationController

  def index
    @issues = Issue.where("zine_id = ?", params[:magazine_id])
  end

  def show
    set_issue
  end

  def new
    @zine = current_zine
    @issue = @zine.issues.build
  end

  def create
    @zine = current_zine
    @issue = @zine.issues.build(issue_params)
    if @issue.save
      redirect_to zine_issue_path(@zine.id, @issue.id)
      else
      render :new
    end
  end

  private

  def current_zine
    Zine.find_by(id: params[:zine_id])
  end

  def issue_params
    params.require(:issue).permit(:name)
  end

  def set_issue
    @issue = Issue.find(params[:id])
  end


end
