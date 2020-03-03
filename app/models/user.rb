class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #:confirmable, :lockable
  


  enum role: [:student, :curator, :hr, :mentor]

end
