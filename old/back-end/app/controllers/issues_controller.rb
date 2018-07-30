class IssuesController < ApplicationController

  def index
    @issues = Issue.where("zine_id = ?", params[:magazine_id])
  end

  def show
    set_zine
    set_issue
  end

  def new
    set_zine
    @issue = @zine.issues.build
  end

  def create
    @zine = Zine.find(zine_params[:zine_id])
    @issue = @zine.issues.build(issue_params)
    if @issue.save
      redirect_to zine_issue_path(@zine.id, @issue.id)
      else
      render :new
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:name)
  end

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def set_zine
    @zine = Zine.find(params[:zine_id])
  end

  def zine_params
    params.permit(:zine_id)
  end

end
