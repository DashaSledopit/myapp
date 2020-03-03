class CandidatesController < ApplicationController

  def index
    @candidate = Candidate.all
  end
    
  def new
    @lab = Lab.find_by(id: params[:lab_id])
    redirect_back(fallback_location: root_path, alert: "Error") unless @lab 
    @candidate = Candidate.new 
  end

  def create 
    @candidate = Candidate.new(candidate_params)
    if @candidate.save 
      CandidateMailer.with(candidate: @candidate).invitation_email.deliver_now
      redirect_to lab_path(id: @candidate.lab_id), notice: "Completed! Please, wait for a test information email!  "
    else
      redirect_to new_candidate_path(@candidate, lab_id: candidate_params[:lab_id]), alert: "Email is taken"
    end
  end
    
  def show
    @candidate = Candidate.find(email: params[:email])
  end

  private
    def candidate_params
      params.require(:candidate).permit(:email, :first_name, :last_name, :lab_id)
    end

end    





