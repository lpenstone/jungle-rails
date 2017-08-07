class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews


  validates :name, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true


  def self.authenticate_with_credentials(email, password)
    if email
      regex = /([A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,})/i
      email_select = regex.match(email).to_s
      user = User.where('lower(email) = ?', email_select.downcase).first
      if user && user.authenticate(password)
        user
      else
        nil
      end
    end
  end

end

