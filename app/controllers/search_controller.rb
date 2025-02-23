class SearchController < ApplicationController
  def index
    if params[:q].present?
      @movies = Movie.where("LOWER(title) LIKE ?", "%#{params[:q].downcase}%")
      @series = Series.where("LOWER(title) LIKE ?", "%#{params[:q].downcase}%")
      @actors = Actor.where("LOWER(name) LIKE ? OR LOWER(surname) LIKE ?", "%#{params[:q].downcase}%", "%#{params[:q].downcase}%")
    else
      @movies = []
      @series = []
      @actors = []
    end
  end

  def suggestions
    query = "%#{params[:q].downcase}%"

    @movies = Movie.where("LOWER(title) LIKE ?", query)
    @series = Series.where("LOWER(title) LIKE ?", query)
    @actors = Actor.where("LOWER(name) LIKE ? OR LOWER(surname) LIKE ?", query, query)

    render "search/suggestions", locals: { movies: @movies, series: @series, actors: @actors }
  end
end
