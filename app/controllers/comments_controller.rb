class CommentsController < ApplicationController
  before_action :set_target, only: [:create]

  def index
    @comments = @movie.comments
  end

  def create
    @comment = @target.comments.build(comment_params)
    @comment.user = current_user
    Rails.logger.debug "User current: #{current_user.inspect}"
    
    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { redirect_to @target, notice: "Comment added!" }
      else
        format.html { redirect_to @target, alert: "Comment not added!" }
      end
    end
  end
  

  private

  def set_target
    if params[:movie_id]
      @target = Movie.find_by(id: params[:movie_id])
    elsif params[:series_id]
      @target = Series.find_by(id: params[:series_id])
    elsif params[:actor_id]
      @target = Actor.find_by(id: params[:actor_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :rating)
  end
end
