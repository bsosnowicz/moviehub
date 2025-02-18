class SearchController < ApplicationController
  def index
    if params[:q].present?
      @movies = Movie.where("LOWER(title) LIKE ?", "%#{params[:q]}%")
      @series = Series.where("LOWER(title) LIKE ?", "%#{params[:q]}%")
      @actors = Actor.where("LOWER(name) LIKE ? OR LOWER(surname) LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @movies = []
      @series = []
      @actors = []
    end
  end
end