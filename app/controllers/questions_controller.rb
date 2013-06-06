class QuestionsController < ApplicationController
  def index
    @users = Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

end
