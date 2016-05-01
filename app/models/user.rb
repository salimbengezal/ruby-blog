class User < ActiveRecord::Base

	belongs_to :role
	before_create :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :comments
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  def admin?
    return self.role == Role.find_by_name('admin')
  end

  def set_admin
    self.role = Role.find_by_name('admin')
  end

  def set_user
    self.role = Role.find_by_name('user')
  end

  private
  def set_default_role
  	self.role ||= Role.find_by_name('user')
  end
end
