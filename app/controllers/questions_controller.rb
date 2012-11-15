class QuestionsController < ApplicationController
  def create
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.build(params[:question])
    @question.save
    @questions = @poll.questions
    
    respond_to { |format| format.js }
  end

  def edit
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    
    redirect_to Poll.find(params[:poll_id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    
    respond_to { |format| format.js }
  end
end
