class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @favorites = Favorite.all
    respond_with(@favorites)
  end

  def show
    respond_with(@favorite)
  end

  def new
    @favorite = Favorite.new
    respond_with(@favorite)
  end

  def edit
  end

  def create
    @favorite = Favorite.new(favorite_params)
    respond_to do |format|
      if @favorite.save
        format.js
      else
        redirect_to root_path
      end
    end
  end

  def update
    @favorite.update(favorite_params)
    respond_with(@favorite)
  end

  def destroy
    @favorite.destroy
    respond_with(@favorite)
  end

  private
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def favorite_params
      params[:favorite].permit(:link)
    end
end
