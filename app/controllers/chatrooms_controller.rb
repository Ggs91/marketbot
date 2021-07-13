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
    chatroom = Chatroom.new(
      questionnaire: Questionnaire.all.sample,
      bot: Bot.new,
      user: current_user
    )

    if chatroom.save
      redirect_to chatroom
    else
      redirect_to root_path, notice: "Chatroom couldn't be created"
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end
end
