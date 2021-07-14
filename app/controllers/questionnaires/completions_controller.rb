class Questionnaires::CompletionsController < ApplicationController
  def create
    @completion = Completion.new(completion_params)
    if @completion.save
      # session[:completion_id] = @completion.id
    else

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
end
