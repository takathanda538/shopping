class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all.order(created_at: :desc)
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_back(fallback_location: root_path)
  end

  def show
    @genre = Genre.find(params[:id])
    @genres = @genre.items
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end