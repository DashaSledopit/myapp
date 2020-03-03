# Preview all emails at http://localhost:3000/rails/mailers/candidate_mailer
class CandidateMailerPreview < ActionMailer::Preview
  def invitation_email
    CandidateMailer.with(candidate: Candidate.first).invitation_email
  end
end
