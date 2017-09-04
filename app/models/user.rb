class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, allow_nil: true

  before_save { |user| user.email.downcase! }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.delete(' '))
    return nil unless user
    if user.authenticate(password)
      user
    else
      nil
    end
  end
end
