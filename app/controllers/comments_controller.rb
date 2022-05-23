class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if !@comment.save
      alert[:notice] = 	@comment.errors.full_messages.to_sentencend
      redirect_to movie_path(params[:movie_id])
    end
      redirect_to movie_path(params[:movie_id])
  end
  private 
  def comment_params
    params.require(:comment).permit(:content).merge(movie_id: params[:movie_id])
    
  end
end