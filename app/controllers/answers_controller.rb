class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params[:answer])

    @answer.save
    
    respond_to { |format| format.js }
  end
end
