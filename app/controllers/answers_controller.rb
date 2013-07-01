class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html
      format.json { render json: @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])
    @comments = Comment.all
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
      format.json { render json: @comments }
      format.json { render json: @comment }
    end
  end
  
  # GET /answers/new
  # GET /answers/new.json
  def new
    @answer = Answer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @question = Question.find(params[:question_id])    
    @answer = @question.answers.find(params[:id])
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @question }
      format.json { render json: @answer }
    end
  end

  # POST /answers
  # POST /answers.json
  def create
    @question = Question.find(params[:question_id])    
    if (@question.user != current_user)        
        @answer = @question.answers.new(params[:answer])
        @answer.user = current_user

        respond_to do |format|
            if @answer.save
                format.html { redirect_to @question, notice: 'Answer was successfully created.' }
                format.json { render json: @question, status: :created, location: @question }
            else
                format.html { render action: "new" }
                format.json { render json: @question.errors, status: :unprocessable_entity }
            end
        end
    else           
        respond_to do |format|
            format.html { redirect_to @question, notice: 'Answer was successfully created.' }
            format.json { render json: @question, status: :created, location: @question }
        end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @question = Question.find(params[:question_id])    
    @answer = @question.answers.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to @question }
      format.json { head :no_content }
    end
  end
end
