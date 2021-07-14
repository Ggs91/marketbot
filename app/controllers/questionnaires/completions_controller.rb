class Questionnaires::CompletionsController < ApplicationController

  before_action :set_questionnaire, only: [:update]
  before_action :set_chatroom, only: [:create, :update]
  before_action :set_bot, only: [:create, :update]

  def create
    user_reply

    @completion = Completion.new(completion_params)
    if @completion.save
      render 'chatrooms/show'
      @bot.listen({
        completion: @completion
      })
    else
      flash.now[:warning] = "Couldn't start the survey, please try again"
      render 'chatrooms/show'
    end
  end

  def update

  end

  private

  def completion_params
    params.permit(
      :questionnaire_id,
      answers_attributes: [:id, :name]
    )
  end

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def set_bot
    @bot = Bot.find(params[:bot_id])
  end

  def user_reply
    current_user.send_message(@chatroom, 'Start ⚡️')
  end
end
