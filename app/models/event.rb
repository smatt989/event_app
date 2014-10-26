class Event < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :startTime, presence: true
  validates :endTime, presence: true
  validate :valid_event_dates?

  private 
    def valid_event_dates?
      self.startTime > self.endTime
    end
end
