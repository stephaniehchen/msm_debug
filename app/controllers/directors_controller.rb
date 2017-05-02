class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
    render("directors/show.html.erb")
  end

  def new_form
    render("directors/new_form.html.erb")
  end

  def create_row
    dob = params[:dob]
    name = params[:name]
    bio = params[:bio]
    image_url = params[:image_url]
    @director = Director.new
    @director.dob = dob
    @director.name = name
    @director.bio = bio
    @director.image_url = image_url

    @director.save

    render("directors/show.html.erb")
  end

  def edit_form
    @director = Director.find(params[:id])
  end

  def update_row
    @director_id = params[:id]
    director = Director.find(@director_id)
    director.dob = params[:dob]
    director.name = params[:name]
    director.bio = params[:bio]
    director.image_url = params[:image_url]
    director.save

    redirect_to("/directors/"+@director_id)
  end

  def destroy
    @director_id = params[:id]
    @director = Director.find(@director_id)
    @director.destroy
  end
end
