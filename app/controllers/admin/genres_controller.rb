class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    genre = Genre.new(params_genre)
    genre.save
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  private

  def params_genre
    params.require(:genre).permit(:name)
  end

end
