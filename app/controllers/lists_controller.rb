class ListsController < ApplicationController
  def index
    @lists = List.all

  end

  def show
    @list = List.find(:id)
  end

  def new
    @list = List.new
  end

  def create

  end
end
