class MoviesController < ApplicationController

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def index
     
     @movies = Movie.where("1 = 1") # Ack
    @all_ratings = Movie.ratings
    @category = params[:category]
    @sort = params[:sort]
    @ratings = params[:ratings]
    if @ratings
        @movies = @movies.where("rating in (?)", @ratings.keys)
    else
      @ratings = {"G" => "1", "PG" => "1", "PG-13" => "1", "R" => "1"}
    end
    if @category and @sort
      @movies = @movies.find(:all, :order => "#{@category} #{@sort}")
    end

  end

  def new
	session.clear
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
