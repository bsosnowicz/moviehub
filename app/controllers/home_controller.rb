class HomeController < ApplicationController
  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result.order(rating: :desc).limit(4)
  end
end