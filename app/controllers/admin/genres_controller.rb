class Admin::GenresController < ApplicationController

  def new
  @genre = Genre.new
  end

  def create
  genre = Genre.new(genre_params)
  if genre.save
  redirect_to admin_genres_path
  else
  render :new
  end
  end

  def index
  @genres = Genre.all
  @genre = Genre.new
  end

  def edit
  @genre = Genre.find(params[:id])

  end

  def update
  @genre = Genre.find(params[:id])
  @genre.update(genre_params)
  if @genre.save
  flash[:notice] = "successfully genre_update"
  redirect_to admin_genres_path
  else
  render :edit
  end
  end

  def genre_params
  params.require(:genre).permit(:name)
  end
end
