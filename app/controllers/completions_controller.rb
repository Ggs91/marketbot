class CompletionsController < ApplicationController
  def create
    @completion = Completion.new(completion_params)
    if @completion.save
    else

    end
  end

  private

  def completion_params
    params.permit(:questionnaire_id)
  end
end
