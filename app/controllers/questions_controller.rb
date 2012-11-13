class QuestionsController < ApplicationController
  def create
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.build(params[:question])
    
    if @question.save
      redirect_to @question.poll
    end
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
    @poll = Poll.find(params[:poll_id])
    
    redirect_to @poll
  end
end
