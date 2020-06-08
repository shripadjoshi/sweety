class User < ApplicationRecord
  #Attribute accessor for the user
  attr_writer :login

  # One user has many readings, we need to destroy all user readings
  # if the user is deleted
  has_many :readings, dependent: :destroy

  # Validates the username uniqueness, presence and format
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setting the login attr to either email or username
  def login
    @login || self.username || self.email
  end

  # Will search the user based on email or username
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
end
