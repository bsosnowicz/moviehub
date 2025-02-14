class CommentsController < ApplicationController
  before_action :set_movie, only: [:create]

  def create
    logger.debug "Current user: #{current_user.inspect}" 
    logger.debug "Movie: #{@movie.inspect}" # 🔍 Debugowanie czy @movie istnieje

    @comment = @movie.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @movie, notice: "Comment added!"
    else
      redirect_to @movie, alert: "Comment not added!"
    end
  end


  private

  def set_movie
    @movie = Movie.find_by(id: params[:movie_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end