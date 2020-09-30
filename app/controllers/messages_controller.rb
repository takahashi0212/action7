class MessagesController < ApplicationController
  def create
    message = Message.create(message_params)
    redirect_to post_path(message.post.id)
    # redirect_to "/posts/#{messages.post.id}", method: :post
  end

  private

  def message_params
    params.require(:message).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
