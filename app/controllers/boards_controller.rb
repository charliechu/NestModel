class BoardsController < ApplicationController
  before_filter :find_board, :only => [:edit, :show, :update, :destroy]
  def index
    @boards = Board.all
  end
  
  def new
    @board = Board.new
  end
  
  def create
    @board = Board.new(params[:board])
    if @board.save
      redirect_to boards_path
    else
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @board.update_attributes(params[:board])
      redirect_to board_path(@board)
    else
      render :action => "edit"
    end
  end
  
  def show
  end
  
  def destroy
    @board.destroy
    redirect_to boards_path
  end
  
  protected
  
  def find_board
    @board = Board.find(params[:id])    
  end
end
