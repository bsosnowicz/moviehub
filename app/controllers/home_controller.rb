class HomeController < ApplicationController
  def index
   @movies = Movie.order(rating: :desc).limit(4)
   @series = Series.order(rating: :desc).limit(4)
   @actors = Actor.order(rating: :desc).limit(5)

   @singleMovie = Movie.order("RANDOM()").limit(1)
  end
end