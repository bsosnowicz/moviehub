class HomeController < ApplicationController
  def index
    @movies = Movie.all
    @actors = Actor.all
    @series = Series.all
  end
end
