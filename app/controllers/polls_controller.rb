class PollsController < ApplicationController
  def new
    @poll = Poll.new
  end
  
  def create
    @poll = Poll.new(params[:poll])
    
    if @poll.save
      redirect_to @poll, :notice => "New poll created successfully!"
    else
      render new_poll
    end
  end

  def show
    if params[:id].to_i > 0
      @poll = Poll.find(params[:id])
    else
      show_vanity_url      
    end
  end
  
  def show_vanity_url
    @poll = Poll.find_by_vanity_url(params[:id])
  end

  def index
    @polls = Poll.all
  end

  def edit
    @poll = Poll.find(params[:id])
  end
  
  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy
        
    redirect_to root_path
  end
  
  def update
    @poll = Poll.find(params[:id])
    if @poll.update_attributes(params[:poll])
      redirect_to @poll
    else
      render :edit
    end
  end
end
