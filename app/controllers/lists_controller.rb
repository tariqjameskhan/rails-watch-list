class ListsController < ApplicationController
  def about
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # @bookmark = Bookmark.find(params[:id])
    @bookmark = Bookmark.new
    # @photo = @list.photo.key
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :image_url, :photo)
  end
end
