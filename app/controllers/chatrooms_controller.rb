class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :destroy ]
  before_action :find_or_create_user, only: [:create]

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @messages = @chatroom.messages
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to @chatroom
    else
      flash.now[:warning] = "Chatroom couldn't be created"
      render :index
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    {
      questionnaire: Questionnaire.all.sample,
      bot: Bot.new,
      user: current_user
    }
  end
end
