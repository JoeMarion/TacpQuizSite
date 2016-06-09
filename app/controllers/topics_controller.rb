class TopicsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_user,       only: [:new, :create, :edit, :update]
  before_action :get_forum,      only: [:new, :create, :show]

  def index
    @topics = Topic.where(forum_id: params[:forum_id]).order("created_at DESC")
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = @user.topics.new
  end

  def create
    @topic = @user.topics.new(topic_params)
    @topic.forum_id = @forum.id
    if @topic.save
      # Handle successful save
      redirect_to forum_topic_path(id: @topic.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def topic_params
      params.require(:topic).permit(:title, :content)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def get_user
      @user = current_user
    end

    # Returns the current forum
    def get_forum
      @forum = Forum.find(params[:forum_id])
    end
end
