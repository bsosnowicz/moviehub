class HomeController < ApplicationController
  def index
    @category = params[:category] || "movies"
    @unreleased_category = params[:unreleased_category] || "movies"

    @q =
      case @category
      when "movies"
        Movie.ransack(params[:q])
      when "series"
        Series.ransack(params[:q])
      when "actors"
        Actor.ransack(params[:q])
      end

    @items = @q&.result&.order(rating: :desc)&.limit(5) || []

    @q_unreleased = 
      case @unreleased_category
      when "movies"
        Movie.ransack(params[:q_unreleased])
      when "series"
        Series.ransack(params[:q_unreleased])
      end

      @unreleased_items = @q_unreleased&.result&.where('release_date > ?', Date.today) || []
  end
end