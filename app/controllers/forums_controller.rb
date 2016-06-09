class ForumsController < ApplicationController
  def index
    @forums = Forum.all
    @categories = []
  end

  def show
    @forum = Forum.find(params[:id])
  end
end
