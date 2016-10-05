class User < ApplicationRecord
  has_many :recipes
  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  # validates :password,
  validates :password, confirmation: true,
  length: { in: 8..72 },
  on: :create

  validates :password_confirmation, presence: true

  has_secure_password

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end

  before_save :admin_default
  # after_save :create_session

  def admin_default
    self.is_admin = false
  end

end
