class CandidateMailer < ApplicationMailer
    default to: -> { Candidate.pluck(:email) },
    from: 'notification@example.com'

    def invitation_email
      @candidate = params[:candidate]
      email_with_name = %("#{@candidate.first_name}" <#{@candidate.email}>)
      mail(to: email_with_name, subject: 'Invitation')
    end

end

