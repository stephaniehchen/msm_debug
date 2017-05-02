class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    render("movies/show.html.erb")
  end

  def new_form
    render("movies/new_form.html.erb")
  end

  def create_row
    title = params[:title]
    year = params[:year]
    duration = params[:duration]
    description = params[:description]
    image_url = params[:image_url]
    director_id = params[:director_id]
    @movie = Movie.new
    @movie.title = title
    @movie.year = year
    @movie.duration = duration
    @movie.description = description
    @movie.image_url = image_url
    @movie.director_id = director_id

    @movie.save

    render("movies/show.html.erb")
  end

  def edit_form
    movie_id = params[:id]
    @movie = Movie.find(movie_id)
    render("movies/edit_form.html.erb")
  end

  def update_row
    @movie_id = params[:id]
    update_movie = Movie.find(@movie_id)
    update_movie.title = params[:title]
    update_movie.year = params[:year]
    update_movie.duration = params[:duration]
    update_movie.description = params[:description]
    update_movie.image_url = params[:image_url]
    update_movie.director_id = params[:director_id]
    update_movie.save

    redirect_to("/movies/"+@movie_id)
  end

  def destroy
    @movie_id = params[:id]
    @movie = Movie.find(@movie_id)
    @movie.destroy
    render("/movies/destroy.html.erb")
  end

end
