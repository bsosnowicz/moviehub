class HomeController < ApplicationController
  def index
    @movies = Movie.all
    @actors = Actor.all
    @series = Series.all

    @moviesUnreleased = @movies.where('release_date > ?', Date.today)
    @seriesUnreleased = @series.where('release_date > ?', Date.today)
  end
end
