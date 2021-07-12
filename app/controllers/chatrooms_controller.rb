class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy ]

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @messages = @chatroom.messages
  end

  # def new
  #   @chatroom = Chatroom.new
  # end

  # def edit
  # end

  def create
    @chatroom = Chatroom.new
    @chatroom.questionnaire = Questionnaire.all.sample

    if @chatroom.save
      redirect_to @chatroom
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  #   if @chatroom.update(chatroom_params)
  #     redirect_to @chatroom, notice: 'Chat room was successfully updated.'
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @chatroom.destroy
  #   redirect_to chatroom_url, notice: 'Chat room was successfully destroyed.'
  # end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  # def chatroom_params
  #   params.require(:chatroom).permit(:name)
  # end
end
