require 'test_helper'

class CommentQuestionsControllerTest < ActionController::TestCase
  setup do
    @comment_question = comment_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_question" do
    assert_difference('CommentQuestion.count') do
      post :create, comment_question: { body: @comment_question.body }
    end

    assert_redirected_to comment_question_path(assigns(:comment_question))
  end

  test "should show comment_question" do
    get :show, id: @comment_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_question
    assert_response :success
  end

  test "should update comment_question" do
    put :update, id: @comment_question, comment_question: { body: @comment_question.body }
    assert_redirected_to comment_question_path(assigns(:comment_question))
  end

  test "should destroy comment_question" do
    assert_difference('CommentQuestion.count', -1) do
      delete :destroy, id: @comment_question
    end

    assert_redirected_to comment_questions_path
  end
end
