class Event < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :startTime, presence: true
  validates :endTime, presence: true
  validate :valid_event_dates?
  validate :picture_size

  private 
    def valid_event_dates?
      if startTime && endTime
      	self.startTime > self.endTime
      else
      	return false
      end
    end

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
