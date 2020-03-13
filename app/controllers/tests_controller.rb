class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]


  def index
    @tests = Test.all
  end

  def show

  end

  def new
    @lab = Lab.find_by(id: params[:lab_id])
    @test = Test.new 
    question = @test.questions.build
    question.answers.build 
  end

  def edit
    @test = Test.find_by(id: params[:id])
  end

  def create
    @test = Test.new(test_params)
      if @test.save
        redirect_to test_path(id: @test.lab_id), notice: 'Test was successfully created.' 
      else
        redirect_to new_test_path(@test, lab_id: test_params[:lab_id]) 
      end
  end

  def update
    @test = Test.find_by(id: params[:id])
      if @test.update_attributes(test_params)
        redirect_to @test, notice: 'Test was successfully updated.'
      else
        render :edit 
      end
  end


  def destroy
    @test.destroy
      redirect_to tests_url, notice: 'Test was successfully destroyed.' 
  end

  private

    def set_test
      @test = Test.find(params[:id])
    end


    def test_params
      params.require(:test).permit(:test_name, :lab_id, questions_attributes: [:id, :question_text, :_destroy, answers_attributes: [ :id, :answer_text]])
    end
end
