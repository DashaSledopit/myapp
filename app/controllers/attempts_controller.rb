class AttemptsController < ApplicationController
  def show
    @attempt = Attempt.find_by(id: params[:id])
  end
end
