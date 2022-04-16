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
  end
  
  def edit
  @genre = Genre.find(params[:id])
  
  end
  
  def update
    @genre = Genre.find(parama[:id])
    @genre.update(genre_params)
    if @genre.save
      flash[:notice] = "successfully genre_update"
    else
    render :edit
    end
  end
  
  def genre_params
  params.permit(:name)
  end
end
