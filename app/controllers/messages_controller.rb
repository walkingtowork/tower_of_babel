class MessagesController < ApplicationController
  # before_filter :require_login, :only => :new
  def index
    #@messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
    @message.update_attributes(:unread => false)

    @reply = Message.new
  end

  def new
    @user = User.find(params[:user_id])
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    @message.update_attributes(:unread => true)

    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  def inbox
    @current_user = User.find(session[:user_id])
    @messages = Message.where(receiver_id: @current_user.id)
  end

  def sent_messages

  end
end
