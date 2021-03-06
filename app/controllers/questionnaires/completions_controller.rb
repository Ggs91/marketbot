class Questionnaires::CompletionsController < ApplicationController

  before_action :set_questionnaire, only: [:create, :update]
  before_action :set_chatroom, only: [:create, :update]
  before_action :set_bot, only: [:create, :update]
  before_action :set_completion, only: [:update]

  def create
    user_reply
    @completion = Completion.new(completion_params)
    respond_to do |format|
      if @completion.save
        @bot.process_survey(@questionnaire, @completion)
        format.html { render 'chatrooms/show' && return }
        format.js { render 'chatrooms/show' }
      else
        format.html {
          flash.now[:warning] = "Couldn't start the survey, please try again"
          render 'chatrooms/show'
        }
        format.js {}
      end
    end
  end

  def update
    respond_to do |format|
      if @completion.update(answer_ids)
        @completion.current_question_index += 1
        @bot.process_survey(@questionnaire, @completion)
        format.html { render 'chatrooms/show' && return }
        format.js { render 'chatrooms/show' }
      else
        format.html {
          flash.now[:warning] = "Couldn't save your answers, please try again"
          render 'chatrooms/show'
        }
        format.js {}
      end
    end
  end

  private

  def completion_params
    params.permit(
      :questionnaire_id,
      :chatroom_id,
    )
  end

  def answer_ids
    if params[:completion][:answer].is_a? Array
      {
        answer_ids: params[:completion][:answer]
      }
    else
      {
        answer_ids: [params[:completion][:answer][:id]]
      }
    end
  end

  def set_completion
    @completion = Completion.find(params[:id])
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


