class IssuesController < ApplicationController

  def index
    @issues = Issue.where("magazine_id = ?", params[:magazine_id])
  end

  def show
    set_issue
  end

  private
  
  def set_issue
    @issue = Issue.find(params[:id])
  end
end
