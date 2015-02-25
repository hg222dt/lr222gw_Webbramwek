class Event < ActiveRecord::Base

  belongs_to :position
  belongs_to :user

  has_many :tags

  validates_presence_of :user, :user_id       #Ser till att vi kräver en användare för sparning av projektet...
  validates_associated :user

  validates_presence_of :position, :position_id #Ser till att vi kräver en position för sparning av projektet...
  validates_associated :position



  validates :EventName, presence: true

  validates :EventDescription, presence: true

  validates :EventDate, presence: true

  # validate :EventDate_is_valid_datetime
  #
  # def EventDate_is_valid_datetime
  #   errors.add(:EventDate, 'must be a valid datetime') if ((DateTime.parse(:EventDate) rescue ArgumentError) == ArgumentError)
  # end


end