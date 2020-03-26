class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def show
    @lab = Lab.find_by(id: params[:lab_id])
    @test = Test.find_by(id: params[:id])
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
    @lab = Lab.find_by(id: params[:lab_id])
    @test = Test.new(test_params)
      if @test.save
        redirect_to test_path(id: @test.lab_id), notice: 'Test was successfully created.' 
      else
        redirect_back(fallback_location: tests_path, alert: "Couldn't find the lab") unless @lab 
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

  def approve
    @test = Test.find_by(id: permitted_params[:test_id])
    answers = permitted_params[:answer].to_h.map do |question_id, answer_id|
      @test.questions.find_by(id: question_id.to_i).correct?(answer_id.to_i)
    end # проходимся по нашим ответам и смотрим какие правильные какие нет
    # модель которая хранит попытку пользователя в данном тесте, записываем в нее количество правильных и неправильных ответов
    attempt = Attempt.create(correct_answers: answers.count(true), wrong_answers: answers.count(false), user: current_user, test: @test)
    redirect_to attempt
  end

  def destroy
    @test = Test.find(params[:id])
      if @test.present?
        @test.destroy
      end
      redirect_to tests_url, notice: 'Test was successfully destroyed.' 
  end

  def outputResult(result)
    console.log("Result" + result);
  end

  private

  def permitted_params
    params.permit(:test_id, answer: {})
  end

  def test_params
    params.require(:test).permit(:test_name, :lab_id, questions_attributes: [:id, :question_text, :_destroy, answers_attributes: [ :id, :_destroy, :answer_text, :correct]])
  end
end
