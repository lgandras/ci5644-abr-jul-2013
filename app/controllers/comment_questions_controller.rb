class CommentQuestionsController < ApplicationController
  # GET /comment_questions
  # GET /comment_questions.json
  def index
    @comment_questions = CommentQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comment_questions }
    end
  end

  # GET /comment_questions/1
  # GET /comment_questions/1.json
  def show
    @comment_question = CommentQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment_question }
    end
  end

  # GET /comment_questions/new
  # GET /comment_questions/new.json
  def new
    @comment_question = CommentQuestion.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment_question }
    end

  end

  # GET /comment_questions/1/edit
  def edit
    @comment_question = CommentQuestion.find(params[:id])
  end

  # POST /comment_questions
  # POST /comment_questions.json
  def create
    @question = Question.find(params[:question_id])
    @comment_question = @question.comment_questions.new(params[:comment_question])
    @comment_question.user = current_user

    respond_to do |format|
      if @comment_question.save
        format.html { redirect_to @question, notice: 'Comment question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comment_questions/1
  # PUT /comment_questions/1.json
  def update
    @comment_question = CommentQuestion.find(params[:id])

    respond_to do |format|
      if @comment_question.update_attributes(params[:comment_question])
        format.html { redirect_to @comment_question, notice: 'Comment question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_questions/1
  # DELETE /comment_questions/1.json
  def destroy
    @question = Question.find(params[:question_id])
    @comment_question =@question.comment_questions.find(params[:id])
    @comment_question.destroy

    respond_to do |format|
      format.html { redirect_to @question, notice: 'Comment questions was successfully deleted' }
      format.json { head :no_content }
    end
  end
end
