class ChatroomController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy ]

  def index
    @chatrooms = ChatRoom.all
  end

  def show
  end

  def new
    @questionnaire = Questionnaire.new
  end

  def edit
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)

    if @questionnaire.save
      redirect_to @questionnaire, notice: 'Chat room was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @questionnaire.update(questionnaire_params)
      redirect_to @questionnaire, notice: 'Chat room was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @questionnaire.destroy
    redirect_to chatroom_url, notice: 'Chat room was successfully destroyed.'
  end

  private

  def set_chatroom
    @questionnaire = Questionnaire.find(params[:id])
  end

  def questionnaire_params
    params.require(:questionnaire).permit(
      :name,
      questions_attributes: [
        :_destroy,
        :id,
        :question_type,
        :name,
        answers_attributes: [:_destroy, :id, :name]
      ]
    )
  end
end
