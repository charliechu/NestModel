class PostsController < ApplicationController
  before_filter :find_board, :only => [:index, :new, :create, :edit, :update, :destroy, :show]
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]
  
  def index
    @posts = @board.posts.all
  end
  
  def new
    @post = @board.posts.new
  end
  
  def create
    @post = @board.posts.new(params[:post])
    if @post.save
      redirect_to board_posts_path
    else
      render :action => "new"
    end
  end
  
  def edit
    
  end
  
  def update
    if @post.update_attributes(params[:post])
      redirect_to board_post_path(@board ,@post)
    else
      render :action => "edit"
    end
  end
  
  def show
    
  end
  
  def destroy
    @post.destroy
    redirect_to board_posts_path
  end
  
  protected
  
  def find_board
    @board = Board.find(params[:board_id])
  end
  
  def find_post
    @post = @board.posts.find(params[:id])
  end
end
