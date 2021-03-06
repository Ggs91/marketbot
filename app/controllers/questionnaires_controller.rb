class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy ]

  def index
    @questionnaires = Questionnaire.all
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
      redirect_to @questionnaire, notice: 'Questionnaire was successfully created.'
    else
      flash.now[:notice] = "Your questionnaire couldn't be created"
      render :new
    end
  end

  def update
    if @questionnaire.update(questionnaire_params)
      redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.'
    else
      flash.now[:notice] = "Your questionnaire couldn't be edited"
      render :edit
    end
  end

  def destroy
    @questionnaire.destroy
    redirect_to questionnaires_url, notice: 'Questionnaire was successfully destroyed.'
  end

  private

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  def questionnaire_params
    params.require(:questionnaire).permit(
      :name,
      :presentation,
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
