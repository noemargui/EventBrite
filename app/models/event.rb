class Event < ApplicationRecord

  has_many :attendances
  has_many :attendees, class_name: 'User',  through: :attendances
  belongs_to :admin, :foreign_key => :admin_id, class_name: 'User'

  #validate :duration_must_be_multiple_of_five
  #validate :start_must_be_in_the_future
  validates :start_date, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0, only_integer: true}
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 1000, only_integer: true}
  validates :location, presence:true

=begin
  def start_must_be_in_the_future
    errors.add(:start_date, "Must be before end time") unless start_date.present? && start_date > Date.today
  end

  def duration_must_be_multiple_of_five
    errors.add(:duration, "Must be a multiple of 5") unless self.duration % 5 == 0
  end
=end

end