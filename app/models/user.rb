class User < ApplicationRecord
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances, foreign_key: 'attendee_id'
  has_many :events, foreign_key: 'admin_id'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true

  def welcome_send #methode d'envoi d'email
    UserMailer.welcome_email(self).deliver_now
  end

end
