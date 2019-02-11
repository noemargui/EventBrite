class Attendance < ApplicationRecord
  after_create :newattendee_send

# les associations
  belongs_to :attendee, class_name: "User"
  belongs_to :event

# méthode pour le mailing
  def newattendee_send #Quand un participant participe à un événement, envoie un email au créateur de l'événement
    AdminMailer.newattendee_email(self).deliver_now
  end

end
